---
marp: true
title: Docker, Your Shell and Security
description: Some ideas on using Docker to improve security workflows
theme: haskell
paginate: true
_paginate: false
---

![bg](./assets/gradient.jpg)

# Docker, Your Shell and Security

#### *Some ideas on how to use Docker to improve security workflows*

<br>

### Spencer Heywood
*Security Analyst @ Utah Education Network*

__https://github.com/heywoodlh/SAINTCON2019__


-------------------------------------------------
# Docker Basics

### What is Docker? 
* A cross-platform container service that can run Linux and Windows Applications.

### What are containers?
* High-level overview of a container: a tiny machine with pre-packaged software.
* I often compare containers to _very_ tiny and single-purpose virtual machines.

-------------------------------------------------
# Why I use Docker?

* Makes it very easy to deploy command line and server applications

* Cross-platform

* Widely used

* User-friendly and well-documented

* Free and open-source

-------------------------------------------------

# A Simple Dockerfile:

###### A Dockerfile contains the build instructions when a Docker image is created.

```bash
FROM alpine    ### Use the official Alpine Docker image as the base

RUN apk add busybox-extras netcat-openbsd    ### Install telnet and netcat

CMD "/bin/ash"    ### Set the default command to run in the container
```
<br>
Once a Docker image is built using this Dockerfile, the image could be used to deploy a container to run `telnet` or `netcat`.


-------------------------------------------------

# Common Container Design Principles

-------------------------------------------------
### Minimal:

* Containers run on tiny Linux (or Windows) distributions.
* Provide the minimum required kernel/OS functionality (networking, package manager, etc.) to run an application.
* Common Linux tools not required by the kernel or application are usually not installed.

I.E. Alpine Linux's container version is a 2.6 MB download (as of October 2019)

-------------------------------------------------

### Single-Purpose:

* Containers are usually built to run a single piece of software.
* For applications that require multiple pieces of software to run, often the deployment requires multiple linked containers.

I.E. for a web application, such as Wordpress, there is often a container dedicated to running your web server _and another separate_ container providing database functionality for the application.

-------------------------------------------------

### Secure:

* Containers provide a layer of isolation from the host running the containers.

* Containers are isolated from other containers, unless explicitly linked.

* Container networking is isolated by default (no exposed ports unless configured otherwise).

-------------------------------------------------

# Some Docker Command Examples:

Pull (download) a Docker image from hub.docker.com for later use:

```
docker pull ubuntu
```

Run an Ubuntu container that runs the command `echo "hello world"`:

```
docker run ubuntu echo "hello world"
```

Get an interactive BASH shell in a newly created Ubuntu container and automatically remove the container ( the `--rm` flag) when the command exits:

```
docker run --rm -it --name my_ubuntu ubuntu bash
```

-------------------------------------------------

List running containers:

```
docker ps
```

Stop and remove a container:

```
docker stop <container id> && docker rm <container id>
```

Start a currently stopped container:

```
docker start <container id>
```

-------------------------------------------------
# Docker for Security

-------------------------------------------------

# Run Security Tools in Docker Containers!

## _Why?_

* Keep your security tools isolated from your host (less clutter, more security).

* Have the same security workflows on Linux, MacOS and Windows (if using WSL 2).

* Use resources more efficiently than with a virtual machine.


-------------------------------------------------
# Running Security Tools in Docker via Your Preferred Shell


Use BASH aliases, Fish functions or a similar mechanism in your preferred shell to shorten long Docker commands into easy-to-use/shortened commands:

For example, the following `nmap` command in Docker:

```
docker run --rm --net host --privileged booyaabes/kali-linux-full nmap -sS 192.168.1.0/24
```

Could be made into a BASH alias:

```
alias nmap="docker run --rm --net host --privileged booyaabes/kali-linux-full nmap $@"
```

Which would then allow you to run the `nmap` Docker alias like so:

```
nmap -sS 192.168.1.0/24
```


-------------------------------------------------
# BASH Aliases and Fish Function

### Start Using Docker+BASH/Fish Today:

A compiled list of common security tool aliases/functions contained in Docker is available for use today in the Github repository of this presentation:

<br>

__https://github.com/heywoodlh/SAINTCON2019__


BASH Aliases: __https://github.com/heywoodlh/SAINTCON2019/blob/master/security-functions.sh__

Fish Functions: __https://github.com/heywoodlh/SAINTCON2019/blob/master/security-functions.fish__

-------------------------------------------------
# Some Example BASH Aliases

-------------------------------------------------
# With Great Power Comes Great Responsibility!

### As shown in the previous slides, Docker can be easily weaponized:
* Docker runs as a privileged service.
* As a privileged service, Docker can do things like access and manipulate network devices and access files/folders that are normally restricted.
* There are _tons_ of potentially dangerous tools that could be used against you if the Docker daemon was accessed maliciously.

###### This doesn't mean you shouldn't use Docker, but you should know the risks before you use it.

-------------------------------------------------

# Some Security Suggestions:

* If Docker won't be used regularly, don't install it.

* Don't be careless with access to the Docker daemon (I.E. on a shared Linux system, don't add users to the `docker` group).

* Use verified/official images from Docker Hub. Malware embedded within Docker containers has been discovered before.

* If using a third party's Docker container look at the Dockerfile when possible. Understand how the container is built and what each command in the Dockerfile is doing. If you aren't sure, don't use the container.

###### Docker is a virtualization tool: a lot of the same risks (and benefits) come with other virtualization tools (Virtualbox, VMWare, etc).
