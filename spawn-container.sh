#!/bin/bash

set -e

exit_func(){
    echo "Entered exit_func"

    if [[ -z $CONTAINER_ID ]]; then
        echo "No Child Container running. Exiting"
        exit 0
    fi

    echo "Killing Container with id: $CONTAINER_ID"
    docker kill $CONTAINER_ID
}

build_run_child_container(){
    docker build -t childimg -f Dockerfile.child .
    CONTAINER_ID=$(docker run -d childimg)
    echo "Child container running with id $CONTAINER_ID"
}

trap exit_func EXIT
build_run_child_container

echo "Hello from Parent. Sleeping now."
sleep infinity