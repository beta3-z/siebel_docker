#Oracle Dabase Image
	! Registration on hub.docker.com required

	https://hub.docker.com/_/oracle-database-enterprise-edition

	docker pull store/oracle/database-enterprise:12.2.0.1
	docker pull store/oracle/database-enterprise:12.2.0.1-slim

#Build senpai base docker image
1. Download Oracle intantclient from https://www.oracle.com/database/technologies/instant-client/linux-x86-32-downloads.html:
    - basik
    - odbc
    - jdbc
    - sqlplu
    - tools
2. Put downloaded instantclients into 0_docker_image/instantclient directory
2. Open command line
3. Run "build_senpai_image.bat"

#Create Images
1. Place siebel image files into "1_create_siebel_images/volume/images" directory
2. From command line run "create_images.bat"

#Build 17.0.0.0 IP
##Build gateway
Run "build_gateway.bat"

##Build application interface
Run "build_application_interface"

##Build enterprise server
Run "build_enterprise_server"

#Upgrate to 19 IP


#Database Credentials
	jdbc:oracle:thin:@localhost:1521:ORCLCDB
	sys as sysdba / Oradoc_db1




#Notes
Xvfb :99 -screen 0 1280x1024x24 &
export DISPLAY=:99

yum install -y unzip
unzip -d /siebel file.zip

export ORACLE_HOME=siebel/$(ls /siebel | grep instantclient)
export TNS_ADMIN=/siebel/
export LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
export PATH="$ORACLE_HOME:$PATH"
export LANG=en_US.UTF-8
     


##Take screenshot from Xbfb
yum -y install epel-release
yum install --enablerepo PowerTools -y ImageMagick

import -display :99 -window root ./shot.png


##Build xdotool library for centos 8
yum install -y gcc /
    git /
    make /
    libX11-devel /
    libXtst-devel /
    libXinerama-devel /
    libxkbcommon-devel

git clone https://github.com/jordansissel/xdotool.git

cd xdotool
make all install

##Using xdotool
http://manpages.ubuntu.com/manpages/trusty/man1/xdotool.1.html

export DISPLAY=:99
xdotool mousemove 760 720
xdotool click 1 ()

function mouse_click() {
    local x=$1
    local y=$2

    xdotool mousemove $x $y
    xdotool click 1
}

function shot() {
    import -display :99 -window root ./shot.png
}

mouse_click 637 525
xdotool type SIEBEL
mouse_click 820 522
xdotool type SIEBEL
mouse_click 760 720

return -> $?