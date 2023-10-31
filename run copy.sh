#!/bin/bash

if "$1" =="view" then
    echo "Param 1 = $1"


if [ $num -gt 0 ]; then
  echo "$num is positive"
elif [ $num -lt 0 ]; then
  echo "$num is negative"
else
  echo "$num is zero"
fi
$1

if "%1%"=="view" goto view
if "%1%"=="log" goto log
if "%1%"=="prune" goto prune
if "%1%"=="build" goto build
if "%1%"=="upload" goto upload
if "%1%"=="deploy" goto deploy
if "%1%"=="exec" goto exec
if "%1%"=="stop" goto stop

echo.
echo Params: %1% - %2%
echo Options: view, prune, all, backend, nginx, frontend, upload, deploy, exec
echo - view: view active containers and images
echo - log: view project's container logs
echo - prune: prune all containers and images
echo - build - all/backend/nginx/frontend: build images
echo - upload - all/backend/nginx/frontend: upload images to DockerHub
echo - deploy - backend/frontend: rebuild image and deploy
echo - exec: exec with available images
echo - stop: stop containers
echo.
goto exit0

@REM --- exec ---
:exec
echo.
echo Exec container with available images
echo.
docker-compose down
docker-compose up --no-build -d nginx backend frontend mysql phpmyadmin
goto exit0

@REM --- stop ---

:stop
echo.
echo Stop container
echo.
docker-compose down
goto exit0

@REM --- view ---
:view
echo.
echo View active containers and images
echo.
docker ps
docker images
goto exit0

echo "Today is " `date`

echo -e "\nenter the path to directory"
read the_path

echo -e "\n you path has the following files and folders: "
ls $the_path
