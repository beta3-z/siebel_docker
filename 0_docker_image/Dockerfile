FROM centos

#ARG JDK=jre-8u241-linux-i586.tar.gz
#ARG TEMP=/usr/tmp
#
#COPY $JDK $TEMP
#
#RUN mkdir /jdk && \
#	tar -xf $TEMP/$JDK -C /jdk && \
#	rm $TEMP/$JDK
#
RUN yum install -y java-1.8.0-openjdk openssl

RUN mkdir /ssl /ssl/Keys /ssl/CA
COPY Keys /ssl/Keys
COPY CA /ssl/CA
RUN cd /ssl/Keys && ./keygen.sh -r .. -s siebel -d *.company.com -c my-custom-ca 2>&1 | tee keygen.log

## X11
#RUN yum install -y xorg-x11-server-Xvfb \
#	xdpyinfo
#
## xdtool
#RUN yum install -y gcc \
#    git \
#    make \
#    libX11-devel \
#    libXtst-devel \
#    libXinerama-devel \
#    libxkbcommon-devel 
#
#ARG XDO=$TEMP/xdtool_build

#RUN mkdir $XDO && \
#	git clone https://github.com/jordansissel/xdotool.git $XDO && \
#	make -C $XDO all install && \
#	rm -rf $XDO

## IP16
#RUN yum install -y --skip-broken \
#	libnsl.i686 \
#	libXtst.i686

# IP19 ?
RUN yum install -y --skip-broken \
	libgcc.i686 \
	libxcb.i686 \
	libX11.i686 \
	libXext.i686 \
	libXau.i686 \
	libcurl.i686 \
	libXrender.i686

RUN rm -rf /var/cache/yum/x86_64 && \
	rm -rf /var/cache/yum/i686 \
	yum clean all

RUN groupadd -g  487 siebel && \
	useradd -m -g siebel -G siebel -u 9999  siebel