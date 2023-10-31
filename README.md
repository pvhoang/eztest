
# --- DEPLOY TO HOST - see EZLEAGUE README ---

# --- PREPARE AWS EC2 - see EZLEAGUE README ---

# New EC2 instance
#     Create instance
#     Change file mode
#     Install tools (composer, docker, git, docker-compose)
ssh -i "eztest.pem" ec2-user@ec2-13-211-60-220.ap-southeast-2.compute.amazonaws.com
[ec2-user@ip-172-31-3-81 ~]$
sudo yum install composer
sudo yum -y install docker
sudo yum install git
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo yum install libxcrypt-compat
sudo usermod -a -G docker ec2-user
sudo service docker start
sudo systemctl enable docker
sudo chmod 666 /var/run/docker.sock
#     Validate and setup 
docker-compose -v
docker version
docker ps
git clone https://github.com/pvhoang/eztest.git
cd eztest/backend
composer install --ignore-platform-reqs

# --- DEPLOY AWS EC2 - see EZLEAGUE README ---

git pull
bash run.sh download
bash run.sh start
docker exec eztest_backend_1 php artisan migrate --seed

Public IPv4 address: 13.211.60.220
frontend: `13.211.60.220:4200`
backend: `13.211.60.220:8000`
phpmyadmin: `13.211.60.220:7000`




# 1 - Prepare DockerHub
run upload all

# 2 - Update GitHub
. Open 'GitHub Desktop' -> Add 'Summary', 'Description' -> Menu 'Repository' -> 'Push' (Ctrl-P)

# 3 - Work with EC2
<!-- icacls.exe eztest.pem /reset
icacls.exe eztest.pem /grant:r "hoang:(r)"
icacls.exe eztest.pem /inheritance:r -->
ssh -i "eztest.pem" ec2-user@ec2-13-211-60-220.ap-southeast-2.compute.amazonaws.com

[ec2-user@ip-172-31-3-81 ~]$
ls eztest
git pull
bash run.sh view
bash run.sh download

# -- Deploy
git clone https://github.com/pvhoang/eztest.git
cd eztest
bash run.sh download
docker-compose up --no-build -d
docker exec eztest_backend_1 php artisan migrate --seed

Public IPv4 address:  54.206.63.91

frontend: `54.206.63.91:4200`
backend: `54.206.63.91:8000`
phpmyadmin: `54.206.63.91:7000`

# -- Debug
// https://www.baeldung.com/ops/docker-container-filesystem
docker exec -it eztest_backend_1 /bin/sh
/var/www/html $
ls
docker exec -it eztest_backend_1 composer install --no-interaction
composer install --no-interaction
exit
D:\dev\aws\eztest>