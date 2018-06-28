Hello and welcome if you line lanacache and need to run it on ubunti server 108.04 then your in the right place.
this has been taken from https://github.com/nexusofdoom/lancache-installe and uses some of the files from 
https://github.com/bntjah/lancache and tweaked to work with ubuntu.

I will try and keep this up to date as muchas possible. If you want the Deian Quick installer  go to https://github.com/nexusofdoom/lancache-installer

Hats off to the Lads for there hard work.

# lancache-installer (Baicly as as https://github.com/nexusofdoom/lancache-installer ) But Tweaked
 
 #Install Ubuntu 18.04 X64 with SSH and Endable sudo
 
 #Download url for Ubuntu
http://mirror.ox.ac.uk/sites/releases.ubuntu.com/releases/18.04/ubuntu-18.04-live-server-amd64.iso
 
 #You will need 20 avaliable IP's free in a row 192.168.x.x to be used by the lancache

#Install git

apt-get install git

#Clone the git repo

git clone -b master 

 
 cd lancache-installer 
 
 chmod +x *.sh 

#Run scripts as sudo or root user

#Run 
 
 ./install.sh
 
#Next run
 
 ./install-jemalloc.sh

#Then run 
 
 ./install-nginx.sh

#After run 
 
 ./install-sniproxy.sh

#Last run 
 
 ./install-lancache.sh