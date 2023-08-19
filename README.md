How I ran the code

1.) create account on VPS (Digital ocean, AWS , GCP etc)

2.) create node.js Application

`	mkdir nodeApp
	cd nodeApp
	npm init --y`
 
3.) install dependencies 
	`npm install mysql body-parser express`

4.) Type Node.js code to perform CRUD
5.) create the Dockerfile

`FROM node:13-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]`

6.) create the docker-compose.yaml for mysql

`version: '3.1'

services:

  db:
    image: mysql:8.0.15
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
       MYSQL_ROOT_PASSWORD: 22suarez
       MYSQL_DATABASE: employeedb
       MYSQL_HOST: 104.248.112.74
       MYSQL_USER: root
    ports:
      - 3306:3306
    # Change this to your local path
    volumes:
      - ~/Database/ORM_Test:/var/lib/mysql`

7.) Push the code to Github Repo

8.) follow the Tutorial here to setup Docker on digital ocean (the Vps I used ) https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

9.) Follow the tutorial to setup docker-compose.yaml on linux VPS https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04

10.) install git on VPS `sudo apt-get install git-all`

11.) run the git clone (my case i did git clone https://github.com/EmekaIwuagwu/docker_test1.git)

12.) Build the app using docker like this `docker build . -t mysql-docker-app`

13.) Run docker compose like this `docker-compose up -d`

14.) run docker ps , you should be faced with a screen like this 

`root@ubuntu-s-1vcpu-1gb-nyc1-01:~/docker-test2# docker ps
CONTAINER ID   IMAGE              COMMAND                  CREATED         STATU                     S         PORTS                                                  NAMES
c4b399c34d21   mysql-docker-app   "docker-entrypoint.s…"   6 seconds ago   Up 4                      seconds   0.0.0.0:3000->3000/tcp, :::3000->3000/tcp              sharp_dirac
7f1d1cc11a05   mysql:8.0.15       "docker-entrypoint.s…"   3 minutes ago   Up 3                      minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   docker-test2_db                     _1`

15.) Lastly, run the final code to start the server 
`docker run -d -p 3000:3000 mysql-docker-app`

Voila , app works 100%
