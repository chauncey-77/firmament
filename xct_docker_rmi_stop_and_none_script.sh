docker ps -a | grep Exited | awk '{print  }'| xargs docker stop
docker ps -a | grep Exited | awk '{print  }'|xargs docker rm
docker images | grep none | awk '{print }' | xargs docker rmi
