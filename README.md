# Inception

Inception is a project that aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## General Guidelines

- This project needs to be done on a Virtual Machine.
- All the files required for the configuration of your project must be placed in a `srcs` folder.
- A Makefile is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using `docker-compose.yml`).

## Mandatory Part

This project consists of setting up a small infrastructure composed of different services under specific rules. Each Docker image must have the same name as its corresponding service. Each service has to run in a dedicated container. The containers must be built either from the penultimate stable version of Alpine or Debian.

You then have to set up:

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.

Your containers have to restart in case of a crash.

## Bonus Part

For the bonus part, you have the possibility to set up extra services. In this case, you may open more ports to suit your needs. The bonus part will only be assessed if the mandatory part is perfect.

Bonus list:

- Set up redis cache for your WordPress website in order to properly manage the cache.
- Set up a FTP server container pointing to the volume of your WordPress website.
- Create a simple static website in the language of your choice except PHP.
- Set up Adminer.
- Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.

## Usage

To run the program, use the following command:

```bash
make
