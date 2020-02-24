#Oracle Dabase Image
	! Registration on hub.docker.com required

	https://hub.docker.com/_/oracle-database-enterprise-edition

	docker pull store/oracle/database-enterprise:12.2.0.1
	docker pull store/oracle/database-enterprise:12.2.0.1-slim

#0 Build senpai base docker image
1. Open command line
2. Run "build_senpai_image.bat"

#1 Create Images
1. Place siebel image files into "1_create_siebel_images/volume/images" directory
2. Change "imageDirectory" parameter inside the "snic_unix.rsp" file to "volume/Siebel_Install_Image".
3. From command line run "create_images.bat" script
4. Image creation will take some time. Wait while it finises.
5. Add parameters to oneclick.properties file:
    dbname=SIEBEL

#2 Install gateway



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