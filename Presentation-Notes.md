Today's presentation will be about using Docker in conjunction with your preferred shell to improve your security workflows. I hope to share some ideas on how Docker can be a great addition to your security toolkit and will be sharing some links so that you can start using Docker today in conjunction with the BASH or Fish shells. As noted on this first slide, please check out the slideshow and the links for your own reference at https://heywoodlh-saintcon2019.netlify.com.

[next slide]

By way of introduction, my name is Spencer Heywood. I have been a Senior Security Analyst at the Utah Education and Telehealth Network for almost two years now. My background is in Linux systems administration and I really enjoy learning how to use open-source tools to improve all aspects of my own life personally and professionally. 

I have been using Docker regularly for about 4 years now. Throughout that time, I would say I've only taken the time to understand it and become competent with it within the past two years. My objective today is to distill some of the basic concepts behind Docker and also share how I've been able to use it to augment my security workflows.

A relevant disclaimer as I will later be talking about using your shell in conjunction with Docker is that I primarily use Fish as my preferred shell on my workstations. Most Unix environments have BASH as the default shell so I still interface regularly with BASH so I thought that would be relevant to focus on primarily during the course of this presentation.

[next slide]

So, what is Docker?

Docker is a cross-platform container service that can run Linux and Windows applications. Docker uses "OS-level virtualization" and Docker containers utilize a single operating system kernel. This means that using a Docker container is typically more resource efficient than using a virtual machine.

Now, what exactly is a container? I've said the word "container" a few times so I think it's appropriate to explain exactly what it is for those who are unfamiliar with the concept.

A container is a tiny machine with a pre-packaged piece of software. I often compare containers to very, very small virtual machines. 

On Linux, containers are possible due to a functionality of the Linux kernel called cgroups, which was mainlined into the Linux kernel in 2007. Cgroups allow multiple isolated Linux systems (containers) to exist on a single control host and is in charge of negotiating resource usage and assignment among those containers. A comparable function exists on Windows called "Job Objects" (introduced in 2014, I believe) which is what enables Docker to run on Windows as well. MacOS' kernel completely lacks a comparable cgroups function so in order to run Docker on MacOS a Linux virtual machine is created to emulate cgroups functionality. That being said, I have seen very little detectable latency on MacOS due to the virtual machine -- Docker feels like a native experience, despite the lack of functionality in the Mach kernel.

Docker is not the only container technology that is available. Docker actually leverages a Linux container runtime called `containerd` (which was developed with Docker containers and Kubernetes in mind). You can actually use `containerd` without Docker if you prefer that kind of workflow. LXC -- which stands for Linux Containers -- is another well-known and Linux-specific alternative to Docker. LXC is what enables Linux applications to run on ChromeOS with the new "Linux Apps" feature. BSD has had containers through Jails since the year 2000.

[next slide]

The primary reason that I use Docker over another container platform is because it's cross-platform. Docker is available on Windows, MacOS, Linux and BSD. This allows my Docker related workflows to be portable across platforms. 

Because Docker is so widely used, many applications house official images on Docker Hub. Docker Hub, located at hub.docker.com, is a public registry of images and where the `docker` command will look by default for Docker images. Almost all of the server applications that I use have an official Docker image which drastically simplifies the deployment of applications for me.

Docker is also very popular. This make it easier to find applications and support.

The Docker documentation is very well developed and readable. However, I acknowledge that you kind of have to know a bit of the Docker jargon before you can fully take advantage of the documentation.

Finally, another big win for me is that you can use Docker for free and it is open source. I should clarify that the Docker Enterprise Edition is not free and open source, it is the Community Edition that is free and open source. Despite it's name, the "Community Edition" is very well developed and is absolutely ready for use in an enterprise as they both come with the same core features. The difference is that the Enterprise Edition comes with additional features such as official same day Docker support, vulnerability scanning, and other nice features. However, technologically, Enterprise Edition and Community Edition have the same core features.

[next slide]

Let's now take a look at a Dockerfile. A Dockerfile contains the build instructions for when a Docker image is created. It will handle things like what base image/operating system should be used for the container -- such as Alpine Linux, Ubuntu, or Windows -- what commands should run when the container is built, what ports to expose, configuration files to copy and so on. I'll touch on this a little more later but if you are going to use a third party Docker image, you should absolutely look at the Dockerfile and understand what's happening before you start using the image.

This Dockerfile is relatively simple. The "FROM ubuntu" statement will ensure the container uses the official Ubuntu Docker image on Docker Hub. The Run statement runs the `apt` package manager in Ubuntu to install Telnet and Netcat. The "CMD /bin/bash" sets the default command that will run when you deploy a container from this image. This type of container would be good for running the `telnet` or `netcat` command once and then having the container autoremove once the command completes.

[next slide]

Before getting into using Docker for security, I think it helps to dig further into common principles behind Docker containers themselves so you can understand how containers are intended to be used. With a technology like Docker it's easy to get excited and carried away using it in ways that it probably shouldn't be used.

[next slide]

Docker containers are meant to be minimal. Typically the underlying operating system within the container is very small in relation to the actual storage space it consumes. For example, a common Linux operating system used for containers is called Alpine Linux and the 64 bit version of Alpine Linux meant for use in containers is a 2.6 MegaByte download. 

Being so small, containers often lack applications and system tools that are often present in a typical Linux environment. Containers often provide only the most basic tools specific to their function such as network functionality, a package manager, and other very basic tools. So if you're tempted to bootstrap a tool on top of a container, you probably shouldn't or you should probably make your own container image.

[next slide]

With the minimal nature of containers in mind, they are typically built for a single purpose. Typically they have a single piece of software that accomplishes a single task. If you have an application that requires a stack of software to run, it is often most common for each piece of software to be running in separate containers that get linked together.

As an example, we could look at a web application running in Docker. Web applications often require database functionality. In Docker, we would most likely have a container that runs the web server and the application and then another separate container that runs a database that the web application container would link with. This example demonstrates the need to isolate containers by function.

The reason for making containers to be single-purpose is so the software can be re-used in other deployments. This is especially important in server deployments, but not as relevant for the security workflows we will be using. It still is important to understand this, though.


[next slide]

Running applications in containers provides a layer of security. As the containers have their own kernel, processes and isolated environment, they can protect the host running Docker and other containers from getting exploited should a container be compromised.

By default, containers are completely isolated and cannot be communicated with unless you explicitly specify them to be accessible from other machines or containers.

[next slide]

With some understanding of Docker principles I think we can venture into using Docker for security workflows.

[next slide]

One of the ways I have used Docker for my security workflows is by running security tools in Docker containers rather than installing them on my machines. Some tools I have started using in Docker are `nmap`, Metasploit, `dirb`, `hydra`, and Gscript.

My primary reason for doing this is because it allows my security workflows to be totally portable between machines. All I have to do is install Docker on my new machine and then configure my shell to begin using these tools. This allows Docker to almost behave like my package manager. Traditionally, I would use a Kali virtual machine which would consume more resources and was/is more cumbersome for tasks I want to run quickly. While a virtual machine still has a lot of value it's not as quick and resource efficient as running a quick Docker command.

Running your security tools in Docker also keep your tools isolated from your machine. Many security tools aren't necessarily built using the best development practices, they often are meant to just get the job done. This doesn't diminish their value or mean those tools shouldn't be used, but caution should be exercised when installing them, especially because security tools are often able to be used for nefarious or malicious purposes. Isolating security tools in a Docker environment prevents you from installing them on your machine directly.

Finally, Docker containers will typically use less resources than a virtual machine. Plus, it's so much quicker to run a command in Docker than to power on a virtual machine, login and then run the command (unless you leave your VM in a suspended state all the time).

[next slide]

One significant downside to running all your security tools in Docker is that Docker commands can get pretty long, especially for complex commands that require a bunch of arguments. To solve this, you can create an alias in BASH, a function in Fish, an alias in Powershell, or another method that's similar in your preferred shell. For those who aren't super comfortable with BASH yet, an "alias" is a command that refers to another command. An alias is almost like a shortcut command for more complex commands.

In this example, we are running the `nmap` command using a kali-linux-full image that's available on Docker hub. As you can see, the initial command is really long. If you take the time to convert that long command into an alias in BASH, you don't have to remember that long command to run the `nmap` command in Docker. Just run `nmap`.

As an alternative, you could probably write your own scripts containing the Docker commands you need but I think aliases are a simpler solution. You could also write functions instead of aliases in BASH. 

Since I use Fish as my preferred shell, I use Fish functions to accomplish this.

[next slide]

In order to save myself and everyone else some time, I have compiled lists of BASH aliases and Fish functions so that you can start using Docker in conjunction with your shell today. The shell scripts are available in the Github repository of this presentation. If you take the time to set this up, you can essentially make all of your machines running Docker and your configured shell into a pen-testing machine without needing to install an additional Kali Linux VM. Virtual Machines have their place, but using Docker in this way allows most of my security tools to be even more portable, quicker to run and more resource efficient. 

Sorry Windows users, I have not taken time to create corresponding Powershell aliases. The Docker daemon on Windows can have slightly different syntax and I just don't use Windows very much (and I was too lazy to take the time to re-write the same aliases in Powershell). However, with the introduction of the Windows Subsystem for Linux 2 (WSL 2), you could in theory use Docker and these shell files the exact same way as on your *nix platforms. With the introduction of WSL 2, there is a lot of cool potential improvements with Docker on Windows as Windows would gets its own dedicated Linux kernel for WSL 2. I have not tested this, though.


[next slide]

As a security professional, using Docker for my security tools makes my life tremendously easier. Docker makes it incredibly easy to weaponize a computer. That's a scary thought because a machine running Docker can easily fetch and begin using security tools maliciously. And it's easy and fast. Tremendous risk is introduced when using Docker. This doesn't mean you shouldn't use Docker at all for this, but the risks should be weighed and considered before deciding to go this route.

The potential risks with Docker come from the fact that it's a highly privileged service. As a privileged service, Docker can mess with network interfaces, access restricted files, mount devices and so on. Docker Hub also houses lots of security software that can be easily accessed. Security tools used by a security professional are also used by malicious actors.

[next slide]

Some simple security tips with Docker would go a long way to make it less risky:

If Docker won't be used regularly don't install it or make it available to end users that won't use it. Don't give access to the Docker daemon in a shared environment.

Use verified and official images from Docker Hub. If for a specific reason an official image won't do I would recommend first writing your own image. If you are going to resort to a third party image, _ALWAYS_ look at the Dockerfile associated with the image if it is available. Understand what each portion of the Dockerfile is doing and why it's doing that. If in doubt, don't use an image. Malware embedded within Docker containers has been discovered before. If being used in a corporate environment, a potential fix would be to restrict access to Docker Hub and then mirror a list of approved images with your own self hosted registry. Open source tools like Portus or the Gitlab Docker Registry make self-hosting your own Docker registry pretty simple.

Most of the same risks and benefits that come with potential abuse against the Docker daemon are present in any virtualization software, for example, Virtualbox and VMWare. Virtualization can quickly be used maliciously against the host running the software since typically virtualization ties into the kernel of the host operating system. Again, this doesn't mean that you shouldn't use Docker but the potential risk should be weighed against the convenience that comes with the tool.

[next slide]

I would highly recommend that you start learning about and using Docker for security if you haven't started yet. It adds a tremendous amount of convenience to security workflows. To get started, I would first recommend installing Docker Desktop on your machine and start playing with it. Next, I would look at the shell config files I have pointed to in this presentation. The `docker` command itself has lots of arguments and features so I would also recommend learning how to use the `docker` command itself. Finally, once you rely heavily on Docker I would recommend looking into best practices with Docker as there are many ways to improve use of Docker. 

There is definitely a reason behind all the tech hype surrounding containers as they have great benefits for all I.T. workflows.

Are there any questions?
