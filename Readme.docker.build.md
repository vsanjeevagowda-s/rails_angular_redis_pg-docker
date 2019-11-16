# Building the docker images in local

* $ docker build -t dockerfile:1 .

* $ docker run -v /home/venku/Documents/projects/:/home/ayu/Documents/ -p 3000:3000 -p 3001:3001 -p 9000:9000 -d dockerfile:1

* $ docker exec -it dockerfile:1 bash 

( User will be logged in as 'root' user )

* $ usermod -u {userid of the hostmachine} ayu

* $ groupmod -g ${groupid of the hostmachine} ayu

* $ su ayu

( User will be logged in as 'ayu' user )

* $ source ~/.bashrc && source ~/.profile

# Running the docker container from docker hub

* $ go to URl: https://hub.docker.com/repository/docker/rramuu1234/rails_angular_redis_pg

* $ docker pull rramuu1234/rails_angular_redis_pg:3

* $ docker run -v /home/venku/Documents/projects/:/home/ayu/Documents/ -p 3000:3000 -p 3001:3001 -p 9000:9000 -d rramuu1234/rails_angular_redis_pg:3

* $ docker exec -it rramuu1234/rails_angular_redis_pg:3 bash 

( User will be logged in as 'root' user )

* $ usermod -u {userid of the hostmachine} ayu

* $ groupmod -g {groupid of the hostmachine} ayu

* $ su ayu

( User will be logged in as 'ayu' user )

* $ source ~/.bashrc && source ~/.profile