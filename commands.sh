#phase 0
docker container run -d -p 80:80 --name nginx nginx
docker container run -d -p 81:80 --name httpd httpd
docker container run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password --name mysql mysql

docker container ls -a
docker container inspect mysql


docker container stop mysql
docker container rm mysql
docker container stop httpd
docker container rm httpd
docker container stop nginx
docker container rm nginx


#phase 1
docker container run -it --name web nginx bash

docker container start web
docker container exec -it web bash

docker container run --name ubuntu ubuntu

docker container run --name ubuntu -d -t ubuntu
docker exec -it ubuntu bash

root@37642e8f5b9a:/# apt-get update
root@37642e8f5b9a:/# apt-get install -y curl
root@37642e8f5b9a:/# url parrot.live

docker container stop ubuntu

docker container run -it --name notliketheother ubuntu bash
root@9ee4109e8238:/# curl parrot.live
bash: curl: command not found
