#!/bin/bash

# Updates da dot-files #

# invoke with '-t' to update terminal settings (invoke as second argument) #
# invoke with '-e' to update external files #
# invoke with '-r' to update repo files #

update_terminal = false
if [ $2 = "-t" ]; then
    $update_terminal = true
fi
    
if [ $1 = "-e" ]; then
    if [ update_terminal = true ]; then
        echo "dslkfj"
    fi

elif [ $1 = "-r" ]; then
    echo "hi"
fi
