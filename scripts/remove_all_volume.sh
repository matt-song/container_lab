docker volume ls | grep -v VOLUME | awk '{print $2}' | xargs docker volume rm
