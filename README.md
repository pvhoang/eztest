# Docker

//  -> clean up docker
docker ps
docker container prune <- for stopped containers
docker images
docker image prune -a <- rmi [image] [image]

// Steps
# 1
<!-- docker-compose up -d --build mysql backend nginx frontend phpmyadmin composer artisan npm -->
docker-compose up -d --build mysql backend nginx frontend

# 2
<!-- docker exec eztest-php-1 php artisan migrate --seed -->
GET localhost:8000/api/migrate
GET localhost:8000/api/seed
localhost:4200 -> 'Migrate', 'Seed'

# 3
docker logs eztest-nginx-1 
docker logs eztest-frontend-1
docker logs eztest-backend-1
docker logs eztest-mysql-1

chrome://settings/privacy
frontend: `localhost:4200`
backend: `localhost:8000`
phpmyadmin: `localhost:7000`

# 4
frontend.src.app.home.home.page.ts -> 'Old ATM' -> 'New ATM'
docker-compose down frontend
docker-compose up -d --build frontend

# 5
docker-compose down






