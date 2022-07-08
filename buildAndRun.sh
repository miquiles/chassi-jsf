#!/bin/sh
if [ $(docker ps -a -f name=crud-pessoas | grep -w crud-pessoas | wc -l) -eq 1 ]; then
  docker rm -f crud-pessoas
fi
mvn clean package && docker build -t phm/crud-pessoas .
docker run -d -p 9080:9080 -p 9443:9443 --name crud-pessoas phm/crud-pessoas
