#   Build PHP and apache2 image using configuration file
-------------------
Created image for the php 8.2, apache2 using ubuntu 22.04 latest LTS version.

Table of Contents
-------------------

 * [Installation](#installation)
 * [Quick Start](#quick-start)
 * [Persistence](#developmentpersistence)
 * [Out of the box](#out-of-the-box)

 Installation
-------------------

 * [Install Docker 24.0.5+](https://docs.docker.com/engine/install/ubuntu/)
 * [Install Docker Desktop application](https://docs.docker.com/desktop/install/ubuntu/)
 
Build the image yourself.

```bash
git clone https://github.com/dineshpithiya/docker-ubuntu22.04-apache-php-with-config.git
cd docker-ubuntu22.04-apache-php
docker build --tag ubuntu-apache-php .
```
View created image
```bash
docker images
```
Quick Start
-------------------

Run the application container:

```bash
docker run -d -p 80:80 ubuntu-apache-php
```
View created containers
```bash
docker ps
```
The simplest way to login to the app container is to use the `docker exec` command to attach a new process to the running container.

```bash
docker exec -it [container_id] bash
```
Start/Run your application in broser. open your favourite browser like google chrome/firefox/edge/safari.
write url like below
[http://localhost/](http://localhost/)

Development/Persistence
-------------------

For development a volume should be mounted at `/var/www/app/`.
The updated run command looks like this.

Suuppose if you wish to modify container and need to add nmap. Login into container using below command
```bash
docker exec -it [container_id] bash
apt-get install nmap
```
The command will download the Nmap package and install it inside the running container.

```bash
nmap --version
```
Now exit container and follow below steps
```bash
exit
```
Commit Changes to Image
```bash
docker commit [CONTAINER_ID] [new_image_name]
docker images
```
If you are doing change in your image file it self then you just modify you dockerfile or sourcode then build and run your container again.

Out of the box
-------------------
 * Ubuntu 22.04 LTS
 * Apache 2.4.x
 * PHP 8.2
 
>Environment depends on the version of PHP.

License
-------------------

Apache + PHP docker image is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
