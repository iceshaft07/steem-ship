# steem-ship

CHOO CHOO!

                ~~~ 
    o        s~~~
            ||    
   ____[]___||___
   \  o o o o o /
~~~~\__________/-x~~~~
  ~
                 ~

Installing the Python SDK for steem was a horrible process. It is not supported on Windows, because the SDK itself (or its dependencies) requires a few unix C++ files of which there is no port. You don't find this out until you've almost got it working.

Installing it on Ubuntu is also a terrible process. Ubuntu requires Python 3.4.3 to be installed, otherwise things like the Unity Desktop fail. I learned that the hard way. I tried as hard as I could to get around this, but I ultimately decided to just build a docker container so I did not mess up my operating system.

I have already written this docker container for you. So I advocate that you do not try to install the Python SDK any other way, because it is a horribly complicated process riddled with problems you won't forsee.

But the good news is, this docker container is super easy to use. Just get Docker installed and you are good to go:

# To build the example
This will build the docker container. A docker container is effectively a Virtual Machine, but much more awesome. When its done, it will print out a hash. This is the ID of your docker container.
> sudo docker build ./
> ...
> Successfully built a7d4be4b0159

# To run the example
To run the example, you will need the hash from the previous example. Pass it in as the parameter. This will print out Ned's account balance.
> sudo docker run a7d4be4b0159
> 5715.609 SBD

# To run customized code, you can use this
This will run any customized code you have. If your not familiar with Docker, the -v parameter maps a directory on your disk to a directory in the Docker container. The python3 command is run at startup by Docker, so you only need to pass in the file name to run.

In this example, we map the src folder of the git repository into the /opt/script folder of the docker container. We then run the /opt/script/customizationExample.py. This file is not included in the build, so if you run without the volume mapping it will not work. You will see that the output is slightly changed.
> sudo docker run -v /home/<username>/steem-ship/src:/opt/script a7d4be4b0159 /opt/script/customizationExample.py
> Ned 5715.609 SBD

# To debug the container
If you are like me and can't remember everything, sometimes you need to log into the container and poke around. The below command will do this. After logging in, you can navigate to cd /opt/script and see what scripts are available. If you are not familiar with docker, try doing this both with, and without the -v parameter.
> sudo docker run -v /home/<username>/steem-ship/src:/opt/script -it --entrypoint /bin/sh snapshot

