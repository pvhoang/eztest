# Docker

//  -> clean up docker
docker ps
docker container prune <- for stopped containers
docker images
docker image prune -a <- rmi [image] [image]


// common
docker-compose up -d --build mysql php server
docker-compose down

docker logs laravel-4104-php-1
docker logs laravel-4104-mysql-1

docker exec laravel-4104-php-1 php artisan migrate --seed
docker exec laravel-4104-php-1 php artisan migrate:fresh --seed --force

chrome://settings/privacy
frontend: `localhost:4200`
backend: `localhost:8000`
phpmyadmin: `localhost:7000`