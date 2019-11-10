# Building the docker images in local

* $ docker build -f dockerfile_pg -t dockerfile_pg:1 .

* $ update the 'FROM dockerfile_pg:1' in dockerfile_rails file

* $ docker build -f dockerfile_rails -t dockerfile_rails:1 .

* $ docker run -v /home/venku/Documents/projects/:/root/Documents/ -p 3000:3000 -p 3001:3001 -p 9000:9000 -d dockerfile_rails:1

# Running the docker container from docker hub