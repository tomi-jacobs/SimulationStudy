#!/bin/bash
Seq-gen 1.3.4
pxrr -t ALL_Supermatrix.tre -g KEBO,RIHU2,SAPU,ANLI2,GIPH2 > ALL_Supermatrix.tre.rooted

sed -i "s/)100/)/g" ALL_Supermatrix.tre.rooted

for x in {1..4850};do seq-gen ../ALL_Supermatrix.tre.rooted -l 5000 -n 1 -m GTR -g 4 > $x\_5000.phy;done

pxcat -s *.phy -p super.model -o super.matrix


iqtree2 -s super.matrix -p super.model -B 1000 -T 10

parallel iqtree2 \-s {} \-T 2 ::: *.phy

