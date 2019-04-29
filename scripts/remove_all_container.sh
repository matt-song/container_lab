docker container ls -a | grep -v "^CONTAINER ID" | awk '{print $1}' | xargs docker container rm
