# docker-devboxnovnc
a docker container with purpose to be a devbox accessible from the browser 


So it is my beginning on creation in github so be nice :)
it's a one display system. no generation of different display for multiple users atm. No sound
for build it, first edit passvnc file to change the password then you just have to do "docker build . -t devboxnovnc

to run it, docker run docker run --name devbox -td -p your_port_number:6080 devboxnovnc


you can attach it some volume if you want to transfer files to it (novnc doesn't yet accept file transfer) with the argument:
-v /your_dir_path:/media/usb

you can add whatever you want as IDE or other things. 

I will refine this project as I configure it properly. only a password is protecting it at a time. 
I will:
- configure it to encrypt the feed. 
- add fail2ban protection
- add user to avoid the usage of root as recommended in all System courses, books and as recommended by docker.
- switch from the auto UI novnc to the more specialized novnc UI.
- add diferent IDE and compilers
- add generation of display for different users
- add sound. 
- add the possibility to choose the window manager 
- different IDE as sublimetext, atom, netbeans, visualcode, codeblocks, spacemacs, jetbrains IDE
- limit the usage of disk space.


at the moment all the layers so sub-containers which is used by this project take 2.6 GB. I have also installed x2go and the possibility to connect to it but still needs some configuration. 


You are welcome to tell me if this project don't build itself on mac or other OSe's but it should build itself on debian-generic OS and windows with last stable version of the docker-engine. If you have other ideas you are welcome too. 
