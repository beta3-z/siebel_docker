# Build senpai docker image which is our base image
1. Download Oracle intantclient from https://www.oracle.com/database/technologies/instant-client/linux-x86-32-downloads.html:
    - basik
    - odbc
    - jdbc
    - sqlplu
    - tools
2. Put downloaded instantclients into 0_base_image/instantclient directory
2. Open command line
3. Run "build_senpai_image"


# Create IP17 Images
1. Place siebel image files into "1_create_IP17_images/volume/images" directory
2. From command line run "create_IP17_images"

# Build 17.0.0.0 IP
## Build gateway
Run "build_gateway"

## Build application interface
Run "build_application_interface"

## Build enterprise server
Run "build_enterprise_server"


# Create IP19 Images
1. Place siebel image files into "1_create_IP19_images/volume/images" directory
2. From command line run "create_IP19_images"

# Upgrate to 19 IP
## Update gateway
Run "update_gateway"

## Update application interface
Run "update_application_unterface"

## Update enterprise server
Run "update_enterprise_server"


# Create Oracle Database


## Download Oracle Dabase Image
1. Register on hub.docker.com if needed
2. To gane acess to Oracle Image you need to fill form on docker hub: https://hub.docker.com/_/oracle-database-enterprise-edition
3. Pull one of Oracle docker images:
    docker pull store/oracle/database-enterprise:12.2.0.1
    docker pull store/oracle/database-enterprise:12.2.0.1-slim

## Database Credentials
	jdbc:oracle:thin:@localhost:1521:ORCLCDB
	sys as sysdba / Oradoc_db1



# Notes I've wrote in research process
Xvfb :99 -screen 0 1280x1024x24 &
export DISPLAY=:99

yum install -y unzip
unzip -d /siebel file.zip

export ORACLE_HOME=siebel/$(ls /siebel | grep instantclient)
export TNS_ADMIN=/siebel/
export LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
export PATH="$ORACLE_HOME:$PATH"
export LANG=en_US.UTF-8

## Take screenshot from Xbfb
yum -y install epel-release
yum install --enablerepo PowerTools -y ImageMagick

import -display :99 -window root ./shot.png


## Build xdotool library for centos 8
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

## Using xdotool
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