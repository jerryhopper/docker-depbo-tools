# docker-depbo-tools

DePbo tools for Linux consists of a shared library and a set of command line tools.
 
This is the source repository for https://hub.docker.com/r/jerryhopper/depbo-tools/

## Update
i added armake to the image. More info: https://github.com/KoffeinFlummi/armake

Usage:  

Assuming there is a file called bogus.pbo in the current directory:

<pre>docker run -it -v $PWD:/home jerryhopper/depbo-tools:latest extractpbo bogus.pbo</pre>


Available commands:

convertwrp, deanm, defxy, dekey, dep3d, depax, depew, derap, dertm, dewss, extractpbo, makepbo, movefolder, moveobject, pbodeps, queryaddons, rapify, armake


<pre>docker run -it -v $PWD:/home jerryhopper/depbo-tools:latest armake</pre>


More info about the commandline tools. : https://mikero.bytex.digital/
