# steem-ship

```
CHOO CHOO!

                ~~~ 
    o        s~~~
            ||    
   ____[]___||___
   \  o o o o o /
~~~~\__________/-x~~~~
  ~
                 ~
```

Installing the Python SDK for steem was a horrible process. It is not supported on Windows, because the SDK itself (or its dependencies) requires a few unix C++ files of which there is no port. You don't find this out until you've almost got it working.

Installing it on Ubuntu is also a terrible process. Ubuntu requires Python 3.4.3 to be installed, otherwise things like the Unity Desktop fail. I learned that the hard way. I tried as hard as I could to get around this, but I ultimately decided to just build a docker container so I did not mess up my operating system.

I have already written this docker container for you. So I advocate that you do not try to install the Python SDK any other way, because it is a horribly complicated process riddled with problems you won't forsee.

But the good news is, this docker container is super easy to use. Just get Docker installed and you are good to go:

### Requirements

You need to install Docker. There are a number of examples on how to do this. The good news is, Docker is super portable, and once you start using it, you won't stop. It works on Mac, Linux and Windows. 

I will place a note that I personally have not been able to get it to work on Windows 7, even after all the updates, even after all of the help articles. I recommend using a Linux disto, as I have personally verified these work.

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04#step-1-%E2%80%94-installing-docker

https://www.howtoforge.com/tutorial/docker-installation-and-usage-on-ubuntu-16.04/



### To Build The Example
This will build the docker container. A docker container is effectively a Virtual Machine, but much more awesome. When its done, it will print out a hash. This is the ID of your docker container.
```
> sudo docker build ./
...
Successfully built a7d4be4b0159
```

### To Run The Example
To run the example, you will need the hash from the previous example. Pass it in as the parameter. This will print out Ned's account balance.
```
> sudo docker run a7d4be4b0159
5715.609 SBD
```

### To Run Your Own Source Code
This will run any customized code you have. If your not familiar with Docker, the -v parameter maps a directory on your disk to a directory in the Docker container. The python3 command is run at startup by Docker, so you only need to pass in the file name to run.

In this example, we map the src folder of the git repository into the /opt/script folder of the docker container. We then run the /opt/script/customizationExample.py. This file is not included in the build, so if you run without the volume mapping it will not work. You will see that the output is slightly changed.
```
> sudo docker run -v /home/<username>/steem-ship/src:/opt/script a7d4be4b0159 /opt/script/customizationExample.py
Ned 5715.609 SBD
```

### To Debug The Container
If you are like me and can't remember everything, sometimes you need to log into the container and poke around. The below command will do this. After logging in, you can navigate to cd /opt/script and see what scripts are available. If you are not familiar with docker, try doing this both with, and without the -v parameter.
```
> sudo docker run -v /home/<username>/steem-ship/src:/opt/script -it --entrypoint /bin/sh snapshot
```

### You Should Do This For Production As Well
This container is pretty much ready for production. The only thing I would recommend doing is adding a non-root user and dropping privileges prior to running Python. If you do this, make note that Alpine does not give access to ports less than 1024, so if you want something running on port 80 and 443, you will need to do port redirection.


### Good luck!
I hope you come up with some great ideas. I also hope I save you the 8 hours I learning the Python Steem SDK is terribly difficult to install.

