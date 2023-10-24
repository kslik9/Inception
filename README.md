# Inception: introduction to DevOps
DevOps : comes from software development (Dev) abd IT operations (Ops) , it's a method in The IT industry for making delivring projects where operators and devlopers works together faster , less iterations and more efficent.
# Inception 
is a DevOps project that aims to create and link containers using Docker 
**docker** : Docker is platform for building , running and delivering . it helps the program to function in your machine as good as it works in another machine. 
**why docker ?** : docker help alot with group projects , example if a new member come to your team and the project you are working on is half way, he doesn't have to download the dependencies the project need to work . docker will do this for him and he wins more than a day tha he was gonna lost on install all this dependencies ``(we will talk about how to do it later)``
every project is working on a isolated environment with its dependencies so when we wanna remove a project after finishing it, we will erase all the libraries etc we dont need anymore
# Vm vs container , isn't the same thing ?
since container is an isolated env for running application , we can create a virtual machine using some of the **HYPERVISORS** like Virtualbox on imac. so a container and a Vm both can have an isolated env for an app and have its own exact depencies to work on its env, yes ! the give us the same isolation level but what about other things ? Vm is consuming resources from the actual hardware and needs a full operating system for each Vm and that's limit  alot the number of Vm we can run on a single machine , in the other hand containers take less hardware resources and it share the operating system of the hosts and more leightweight than a Vm 
# How docker works(the architecture)
docker uses a client to server architecture , client talks to server using a restful api. and as we said containers run on the host op(operating system) so the op present containers just like  anormal proccess . every op has it's own native conatainer like linux and Windows , but in Mac you gotta use a lightweight linux Vm and a linux container
![Architecture-of-Docker](https://github.com/kslik9/Inception/assets/115497057/81affb9c-b573-46d9-8aa1-e94be81b6d75)
# Terminologies in docker

**docker image** : acts as a set of instruction to create docker container 

**docker container** : is the runtime phase of docker image, it stors all the depencies the program needs 

**docker file** : it's like a source code it contains the necessary command to excute and assemble the docker image

**docker engine** : its the underlying technology that handles the tasks involving builduing container based application you can represent it as a Hypervisor on Vm

**docker hub** : the official online repository where you can pull the images are available for use it's like github for docker images
# Docker Container Lifecycle Management
each docker container has different stages, some of states are : **Created running paused stopped and deleted**
![Capture-5](https://github.com/kslik9/Inception/assets/115497057/5f6c1b23-c82a-4ba2-b768-99cf2af863d3)
# Installing and creating linux Vm
if you have a mac , you need a vm with lunix op as we said before , so you gotta get one of the Hypervisors "i choosed Virtualbox" and create a new machine . after installing [ubuntu server](https://ubuntu.com/download/server) you have to lunch your Vm after the configuration "choose the Ram Rom you want , i choosed 4GB and 30GB" then download a graphical interface "lightdm or gdm is recommended" now your Vm is ready for docker !
# Download docker 
first check if you have docker installed already , you can check with docker version , if its not installed you can get it from [here](https://docs.docker.com/engine/install/) , check again with ``docker version`` command and it need to show you the client and server version if any error occured you can search to fix it and run ``docker run hello-world`` to make sure everything is working as excpected 
# dockerize your App
dockerize an App means we make small changes to the app so it can be run by docker , by add a docker file that includes instruction that docker uses to package up the app into an image , this image contains every dependency our app needs to work , once we have an image we can start a container using that image using it's own file system provided by the image
# Some docker commands you may need
**docker build -t <tag_name> </directory you wanna use>** :  used to create a Docker image from the contents of a specified directory.

**docker run -d -p 80:80 <image_name>** : -d for detached -p for the port that other machins can connect, this command is used to run a container

**docker ps** : show ongoing containers

**docker ps -a** :  used to list all containers on your system, including both running and stopped containers

**docker stop <con_id>** : to stop a container

**sometimes docker stop wont work and show you an error : cannot stop container** : it's a problem happens on the AppArmor , you can use the command ``sudo aa-remove-unknown`` to fix that

**daemon** : in short term the deamon manage the docker objects such imags containers and more , and deamon off runs the container in foreground , if u delete it and run it on the background will cause the container to exit immediately
# The beauty of docker 
like git and github docker has its own dockerhub , dockerhub its a collaboration and storage for docker image that when a docker image is uploaded to dockerhub anyone could put the image in any machine running on docker and have the same isolated env and the same results as we have in our development machine 
# Your first hello world docker program
if you are like me using a Mac , you have to Use a Vm for docker . **first** you gonna go to your Desktop create a new folder and inside it create a small hello world sourcecode with the language you like, for me i choosed C
<pre>
``#include <stdio.h>
int main()
{
	printf("ana tntesti");
}``
</pre>
and on the same folder create a file called Dockerfile with a capital D . and write a basic elements on it , for C i used 
<pre>
``FROM gcc:4.9   //From means the image that ur container will build upon it , and here i used gcc:4.9 "an official image from docker fo c programs"
COPY ./ /usr/src/myapp  //Copy my directories and files from my host machine into the docker image
WORKDIR /usr/src/myapp //specifies the working directory 
RUN gcc -o myapp k.c //the run command run the program inside your container here gcc my file.c
CMD ["./myapp"]     //and lastely here open the ./myapp program and excute it inside your image``
</pre>
# Nginx Container
let's pretend you don't know anything about web . when you visit a website like a normal person , your request travel first to a webserver and it's job it to look for the requested resource and send it back as a response . theres a lot of webservers but nginx is one of the most popular ones, you can find it in twitch shopify tinder and more ! , why ? because of it can handle more than 10k simultaneous event and its good security and caching for better performance .

~ **what is Nginx** ~
an open-source lightwight fast and high-performance webserv , it serves for many protocols like HTTP/HTTPS SMTP and more ! 

**nginx must be configured using TLS 1.2 or 1.3 only .**
Tls is a short word for Transport layer security , it is a cryptographic protocol designed to provide network communication security and its used on apps like the IM (instant messaging) , VoIP and more to secure communication between server and client 

after we install nginx through apt install nginx , we need to create the TLS/SSL certificate , ``because theres a lot of commands and explanations you have to enter here and follow this`` [tutorial](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7)

**TLS handshake**
if we dive deep into teh TLS , we gonna need to know the TLS handshake , short answer the handshake is when a user navigates a website over HTTPS and the browser start connecting to the origin server and also other HTTPS connection like API calls and DNS over HTTPS queries , During the course of a TLS handshake the client and server will specify which version of TLS they will use, like here we are usign TLSv1.2 or TLSv1.3 and verify each other and agree on session keys , this just a very short explaination from what i understand you can search for more it is fun !

**the DHparam.pem file**
to config a TLS you have to generate DHparam file , the DHparam is a mathematical method of seurely exchanging cryptographic keys , how it works ? every part gives its different DH key and when it's combined they result in a different calculation on each side , with results which will be equal

**the crt file**
a .crt file contains SSL/TLS certificate its the public key that includes information about the entity who owns the certificate 

**the key file**
a .key file contains the private key which corresponds to the public key in the certificate , it keept secret to crypt and decrypt data and for proving the server identity 

# MariaDB Container
**MariaDb** is a relational database managment system and its a fork from MySQL in 2009 , it intends to remain open source and free to use . 

**installing MariaDB in linux**
To keep this documentation concise, I recommend incorporating that [article](https://www.cherryservers.com/blog/how-to-install-and-start-using-mariadb-on-ubuntu-20-04) which includes comprehensive steps and explanations. Additionally, consider conducting further research to gather additional information.

**Automating `mysql_secure_installation`**
to make our database good and doesnt need uphead configuration to start working , we have to automate our database with the help of a sql script.
the script has to setup some mandatory things which is the next.
**(i recommend start do the following steps without a script)**
firstly it has to setup the database root password and delete anonymous users , remove the test database , flush the privileges tables and for some fun create small table and insert some object to it . for the setup this [tutorial](https://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/) explain everything in details i highly recommend it .

secondly for the table adn insertting on it you have to create a **database**(a collection of tables which stores different sets of structred data) at first by Using ``'CREATE DATABASE <name>'`` , second enter into the database with the ``'USE <name>'`` . since you are inside the database you have to create a **table**(you can understand it as adouble array where is has collumns and rows of data) inside of it now . to do a simple example ``CREATE TABLE <name_fo_database>(<name_of_var> <type_of_var> );``
example : 
``CREATE TABLE ksalka(
    lvl INT
);``

and then insert value with ``INSERT INTO <name_databse>(<namevar>) and then inter VALUES (<values>);``
now you can see that by **SELECT <name_var> FROM <name_database>;**

you liked it , it feels easy ? now try to do it in ascript and put it in a .sql file and try make it work .

you did it ? good job ! 

now let's make it more automatised with a bash script , you have to make a bash script that enter the sql script into mariadb 

# WordPress + php-fpm container
**Wordpress** is a content management system that allows you to host and build websites.

**php-fpm** is a primary php FastCGI (the interface that interacte programs with a web server) its very useful for heavy-loaded websites

we will try to lunch our wordpress page without using a webserver , first we will install php-fpm with ``sudo apt-get install php-fpm`` 

then download wordpress
``sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz -C /var/www/html``
 then  we will run a php build-in server with
``cd /var/www/html/wordpress
php -S 0.0.0.0:8080``
now the wordpress home page is on your localhost:8080 , i will show you an error that database should be connected with the wordpress page , to fix that you have to cut off your built-in server and create a wp confign file and put it the infos about your database , like we did earlier , we used mariadb . we gonna do 
``mv wp-config-sample.php wp-config.php //to create the config file ``
and we will fill those 
``define('DB_NAME', 'your_db_name');
define('DB_USER', 'your_db_user');
define('DB_PASSWORD', 'your_password');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8mb4');
``
then we relaunch our server the wordpress will automatically give access to us 

for your own host this configuration its gonna work , but that's not our goal . to make it on a container we should make a bash script that do this for us , and here you need to search for yourself a bit

**php-fpm** : a good [tutorial](https://www.digitalocean.com/community/tutorials/php-fpm-nginx) to help you do this !

# Docker network
after we establish wordpress and configure it we need to link it with our database , here where docker network come to work. ![1kapx9fwe15vs91ddwm3](https://github.com/kslik9/Inception/assets/115497057/23aeb784-68ff-4eae-9898-92bca4b282a7)

a network created using the bridge network is isolated from the host's network , meaning that the containers have their own network stack and IP address space.

first we will start with explaiing bridge driver , it can be used to create an internal network withing a single docker host 

i wrote a long guide but it will take too much time , i found this [tutorial](https://dev.to/alubhorta/the-bridge-network-driver-networking-in-docker-6-1ahf) which will help you to make it easy and forward

# Docker volumes
After a docker container is stopped all the changes inside it is lost, and to resolve this problem docker volumes are here to help, every container is contains a lot of layers , the first ones are for teh image layers and at the top of them the container layer which you can write and read from , but when the container is stopped the container layer is removed, here where the docker volume comes to work and sync with the container's layer and save all the new writed data

![layers](https://github.com/kslik9/Inception/assets/115497057/159e8ad5-557d-4449-a880-15d2c4cf863b)

# Docker compose
using several different containers to manage a project become too slow because you have to build run and connect every container , it's like compiling a big project with several and multiple files *.c and you have to write gcc and all the files every time you wanna compile , sound exhausting isn't?. here it comes docker compose, it works like a makefile . a .YAML file that helps you to build all the conatiners and run them with only a click , and stop and kill with one button . that's a short overview for it , [here](https://www.baeldung.com/ops/docker-compose) you will find a tutorial with everything related to it it helps , and i suggest you search for it a loot it's fun and very helpful 

# Conclusion
docker is a beautiful and fun tool that help you to become unbeatable , it's hard to learn it with theorical courses , in the other hand just making a small program and practice , face problems and find solution for it will make you stronger and much better on it ! , in the end i hope you found it fun and helpful 

**made with love for you 💕**
