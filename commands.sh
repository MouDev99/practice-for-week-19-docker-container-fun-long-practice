docker container run -d -p 80:80 --name nginx nginx
docker container run -d -p 81:80 --name httpd httpd
docker container run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password --name mysql mysql

docker container ls -a

docker container stop mysql
docker container rm mysql
docker container stop httpd
docker container rm httpd
docker container stop nginx
docker container rm nginx
