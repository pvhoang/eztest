# --- DEPLOY TO HOST - see EZLEAGUE README ---

# --- DEPLOY TO AWS EC2 - see EZLEAGUE README ---

# 1 - Prepare DockerHub
run upload all
<!-- run upload backend
run upload frontend
run upload nginx -->
// validate upload in https://hub.docker.com/ hoang12345/phan12345

# 3 - Work with EC2
icacls.exe ezec2-2.pem /reset
icacls.exe ezec2-2.pem /grant:r "hoang:(r)"
icacls.exe ezec2-2.pem /inheritance:r
ssh -i "ezec2-2.pem" ec2-user@ec2-54-206-63-91.ap-southeast-2.compute.amazonaws.com
[ec2-user@ip-172-31-3-81 ~]$
docker ps

# 1 - Update GitHub
. Open 'GitHub Desktop' -> Add 'Summary', 'Description' -> Menu 'Repository' -> 'Push' (Ctrl-P)
git pull

# -- Deploy
git clone https://github.com/pvhoang/eztest.git
cd eztest

bash run.sh

<!-- docker pull hoang12345/eztest-backend
docker tag hoang12345/eztest-backend eztest-backend
docker pull hoang12345/eztest-frontend
docker tag hoang12345/eztest-frontend eztest-frontend
docker pull hoang12345/eztest-nginx
docker tag hoang12345/eztest-nginx eztest-nginx -->

docker-compose up --no-build -d
docker exec eztest_backend_1 php artisan migrate --seed

Public IPv4 address:  54.206.63.91

frontend: `54.206.63.91:4200`
backend: `54.206.63.91:8000`
phpmyadmin: `54.206.63.91:7000`


exit
D:\dev\aws\eztest>