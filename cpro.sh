#!/bin/bash





if (($# > 0)); 
then
    PROJECT_NAME=$1
    clear
    mkdir -pv $PROJECT_NAME
    mkdir -pv $PROJECT_NAME/app/
    mkdir -pv $PROJECT_NAME/src/
    mkdir -pv $PROJECT_NAME/doc/

    cp -v $HOME/.local/bin/CPro/Makefile $PROJECT_NAME/Makefile
    cp -v $HOME/.local/bin/CPro/main.c $PROJECT_NAME/app/main.c
 
    sed -i "s/target/$PROJECT_NAME/" $PROJECT_NAME/Makefile
   
    doxygen -g $PROJECT_NAME/Doxyfile
    
    echo "## $PROJECT_NAME" $PROJECT_NAME/README.md

    echo "Project $PROJECT_NAME prepared."
else
    echo "No input project name!"
    echo "cproj <project name>"
fi
