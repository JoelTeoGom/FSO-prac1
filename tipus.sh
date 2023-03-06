#!/bin/bash

function tipus() {

    if [ -f $file ]
    then 
        echo "es fitxer"
        exit 1
    elif [ -d $file ]
    then
        echo "es directori"
        exit 2
    else
        echo "es una altre cosa"
        exit 3
    fi 

}

file=$1
tipus 
