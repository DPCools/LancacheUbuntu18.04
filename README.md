Hello and welcome if your looking a lanacache and need to run it on Ubuntu Server 18.04 then your in the right place.
This has been taken from https://github.com/nexusofdoom/lancache-installer and uses some of the files from https://github.com/bntjah/lancache and tweaked to work with ubuntu.

I will try and keep this up to date as much as possible. If you want the Debian version of this installer the goto https://github.com/nexusofdoom/lancache-installer

Hats off too the Lads for there hard work.

# lancache-installer (https://github.com/nexusofdoom/lancache-installer) But Tweaked
 
#So go and get Ubuntu Server then install Ubuntu 18.04 X64
 
 #Download url for Ubuntu 18.04
http://releases.ubuntu.com/18.04/

--------- For Ubuntu 18.04.1  (Skip for 18.04 install ) ---------
Back up your sources.list file

    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

To add the repository, edit the file using nano (or your favorite editor)

   sudo nano /etc/apt/sources.list

Find the line

    deb http://archive.ubuntu.com/ubuntu bionic main

Append universe -- this instructs apt-get to first look for packages in the main repository then the universe repository

    deb http://archive.ubuntu.com/ubuntu bionic main universe

Save the file

CTRL + O then ENTER when prompted for the file name (autofilled /etc/apt/sources.list)

Exit nano

CTRL + X

Update your sources with the new repositories

sudo apt-get update

then run the install script

-----------------------------------------------------------------
 
 #You will need 20 avaliable IP's free in a row 192.168.x.x to be used by the lancache

#Once installed just do the below and make ya self sudo user.

 sudo -i  

(enter password when asked)

#make sure SSH installed so you can putty in and do the rest.

apt install openssh-server -y

#Now go to putty SSH in then copy and past the rest. (Besmart)

#Get your updates done.

 apt update -y 
 
 apt upgrade -y

#Right time to install git

 apt install git

#Clone the git repo

 git clone -b master https://github.com/DPCools/LancacheUbuntu18.04.git

#Move to the directoy

 cd LancacheUbuntu18.04 
 
#Make sh files executable 

chmod +x *.sh 

#Run the following in the order below looking out for errors.
 
 ./install.sh   (will need a reboot after this as it makes your nic eth0 from what ever it is after install)
 
 ./install-jemalloc.sh

 ./install-nginx.sh

 ./install-sniproxy.sh

 ./install-lancache.sh

#And thats it just set your client PC DNS to this server then off you go.
#So now if if some one downloads a Steam or MS game once  it will never need to download again untill the cache times out.

#Happy fragging :) 

