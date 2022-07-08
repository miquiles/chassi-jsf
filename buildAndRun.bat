@echo off
call mvn clean package
call docker build -t phm/crud-pessoas .
call docker rm -f crud-pessoas
call docker run -d -p 9080:9080 -p 9443:9443 --name crud-pessoas phm/crud-pessoas