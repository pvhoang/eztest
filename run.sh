#!/bin/bash

# https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners
# https://ryanstutorials.net/bash-scripting-tutorial/

case $1 in

    exec)
        echo .
        echo Exec container with available images
        echo .
        docker-compose down
        docker-compose up --no-build -d nginx backend frontend mysql phpmyadmin
        ;;
        
    stop)
        echo .
        echo Stop container
        echo .
        docker-compose down
        ;;

    view)
        echo .
        echo View active containers and images
        echo .
        docker ps
        docker images
        ;;

    download)
        echo .
        echo Download images from DockerHub
        echo .
            docker pull hoang12345/eztest-backend
            docker tag hoang12345/eztest-backend eztest-backend
            docker pull hoang12345/eztest-frontend
            docker tag hoang12345/eztest-frontend eztest-frontend
            docker pull hoang12345/eztest-nginx
            docker tag hoang12345/eztest-nginx eztest-nginx
        ;;

    *)
        echo don\'t know
    ;;
esac

