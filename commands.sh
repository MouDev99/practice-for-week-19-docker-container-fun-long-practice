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

#phase 2

docker container run -d --name characters alpine /bin/sh -c "while :; do wget -qO- https://swapi.dev/api/people/?search=r2; printf '\n'; sleep 5s; done"

docker container logs characters

docker container stop characters
docker container rm characters

#phase 3

docker network create --driver bridge mybridge

docker container run -d --net mybridge --net-alias srch --name elas_srch_1 elasticsearch:2
docker container run -d --net mybridge --net-alias srch --name elas_srch_2 elasticsearch:2

docker container inspect elas_srch_1

docker container run --net mybridge --name alpine alpine /bin/sh -c "nslookup srch"

docker container run -d -it --net mybridge --name centos-container centos
docker exec -it centos-container bash
curl -s srch:9200


docker container restart centos-container
docker exec -it centos-container bash -c "curl -s srch:9200"

docker container restart centos-container
docker exec -it centos-container bash -c "curl -s srch:9200"
