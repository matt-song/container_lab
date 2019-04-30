#!/bin/bash

PrintHelp()
{
    echo "
    Usage: use this script to remove container, for lab test only

        $0 -h                - print this message
        $0                   - Remove offline container 
        $0 -a                - Remove both running and offline container
    "
}

RemoveContainer()
{
    ContainerCount=`docker container ls -f status=exited  | grep -v "^CONTAINER ID" | wc -l`
    if [ $ContainerCount -gt 0 ]
    then 
        echo "Removing below container:"
        docker container ls -f status=exited | grep -v "^CONTAINER ID" | awk '{print $1}' | xargs docker container rm
    else
        echo "No container found, exit..."
    fi
}

StopRunningContainer()
{
    haveRunningContainer=`docker container ls  | grep -v "^CONTAINER ID" | wc -l`
    if [ $haveRunningContainer -gt 0 ]
    then
        echo "Found below running container, stopping them first.."
        docker container ls  | grep -v "^CONTAINER ID" | awk '{print $1}' | xargs docker container stop
        echo ""
    fi
}

while getopts "ha" arg; do
    case $arg in
        h)
            PrintHelp
            ;;
        a)
            RemoveAll=1
            ;;
    esac
done

if [ x"$RemoveAll" = "x1" ]
then    ### Remove all container ###
    StopRunningContainer        
    RemoveContainer
else    ### remove offline container ###
    RemoveContainer
fi
