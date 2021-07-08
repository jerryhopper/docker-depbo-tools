# docker-depbo-tools

DePbo tools for Linux consists of a shared library and a set of command line tools.
 
This is the source repository for https://hub.docker.com/r/jerryhopper/depbo-tools/



Usage:  

Assuming there is a file called bogus.pbo in the current directory:

<pre>
docker run -it -v $PWD:/home jerryhopper/depbo-tools:latest extractpbo bogus.pbo
</pre>

Available commands:
<pre>
convertwrp
deanm
defxy
dekey
dep3d
depax
depew
derap
dertm
dewss
extractpbo
makepbo
movefolder
moveobject
pbodeps
queryaddons
rapify
</pre>





## Update
i added armake to the image. More info: https://github.com/KoffeinFlummi/armake

<pre>
docker run -it -v $PWD:/home jerryhopper/depbo-tools:latest armake

Usage:
    armake binarize [-f] [-w <wname>] [-i <includefolder>] <source> [<target>]
    armake build [-f] [-p] [-w <wname>] [-i <includefolder>] [-x <xlist>] [-k <privatekey>] [-s <signature>] [-e <headerextension>] <folder> <pbo>
    armake inspect <pbo>
    armake unpack [-f] [-i <includepattern>] [-x <excludepattern>] <pbo> <folder>
    armake cat <pbo> <name>
    armake derapify [-f] [-d <indentation>] [<source> [<target>]]
    armake keygen [-f] <keyname>
    armake sign [-f] [-s <signature>] <privatekey> <pbo>
    armake paa2img [-f] <source> <target>
    armake img2paa [-f] [-z] [-t <paatype>] <source> <target>
    armake (-h | --help)
    armake (-v | --version)
</pre>


More info about the commandline tools. : https://mikero.bytex.digital/
