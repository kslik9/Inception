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

**docker image** : a file used to execute code in a docker container and acts as a set of instruction to create it

**docker container** : is the runtime phase of docker image, it stors all the depencies the program needs 

**docker file** : it's like a source code it contains the necessary command to excute and assemble the docker image

**docker engine** : its the underlying technology that handles the tasks involving builduing container based application you can represent it as a Hypervisor on Vm

**docker hub** : the official online repository where you can pull the images are available for use it's like github for docker images
# Installing and creating linux Vm
if you have a mac , you need a vm with lunix op as we said before , so you gotta get one of the Hypervisors "i choosed Virtualbox" and create a new machine . after installing [ubuntu server](https://ubuntu.com/download/server) you have to lunch your Vm after the configuration "choose the Ram Rom you want , i choosed 4GB and 30GB" then download a graphical interface "lightdm or gdm is recommended" now your Vm is ready for docker !
# Download docker 
first check if you have docker installed already , you can check with docker version , if its not installed you can get it from [here](https://docs.docker.com/engine/install/) , check again with ``docker version`` command and it need to show you the client and server version if any error occured you can search to fix it and run ``docker run hello-world`` to make sure everything is working as excpected 
# dockerize your App
dockerize an App means we make small changes to the app so it can be run by docker , by add a docker file that includes instruction that docker uses to package up the app into an image , this image contains every dependency our app needs to work , once we have an image we can start a container using that image using it's own file system provided by the image
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
# Creating Nginx container
let's pretend you don't know anything about web , webservers etc. when you visit a website not like a programmer or an IT lover just a normal person , your request travel first to a webserver and it's job it to look for the requested resource and send it back as a response . theres a lot of webservers but nginx is one of the most popular once you can find it in twitch shopify tinder and more ! , why ? because of it can ahndle more than 10k simultaneous event and its security and caching for better performance .

**nginx must be configured using TLS 1.2 or 1.3 only .**
Tls is a short word for Transport layer security , it is a cryptographic protocol designed to provide network communication security and its used on apps like the IM (instant messaging) , VoIP and more to secure communication between server and client 
