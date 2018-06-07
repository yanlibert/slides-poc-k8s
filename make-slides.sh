#!/bin/sh
#
#
dir=$(pwd | sed 's/\//\ /g' | awk '{print $NF}')
#
if [ $dir != "slides-poc-k8s"  ]
then
    echo "Ce script doit etre execute a la racine du projet"
    exit 1
fi
#
cat ./public/slides/head.part > ./public/index.html
ordre=$(cat ./public/slides/ordre)
#
for slide in $ordre
do
    cat ./public/slides/$slide >> ./public/index.html
done
#
cat ./public/slides/tail.part >> ./public/index.html
