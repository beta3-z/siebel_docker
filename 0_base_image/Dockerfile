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

RUN groupadd -g  487 siebel && \
	useradd -m -g siebel -G siebel -u 9999  siebel

ENV INSTANT_CLIENT_VERSION=19.6
COPY instantclient /

# IP19 ?
RUN yum install -y --skip-broken \
	libgcc.i686 \
	libxcb.i686 \
	libX11.i686 \
	libXext.i686 \
	libXau.i686 \
	libcurl.i686 \
	libXrender.i686 \
	libnsl.i686 \
	ksh \
	tcsh \
	libstdc++.i686 \
	glibc.i686 \
	libaio.i686 \
	&& yum -y --skip-broken localinstall   oracle-instantclient*.i386.rpm \
	&& yum clean all \
	&& rm oracle-instantclient*.rpm \
#	&& ln -s /usr/lib/oracle/$INSTANT_CLIENT_VERSION/client/lib/libclntsh.so.12.1 /usr/lib/oracle/$INSTANT_CLIENT_VERSION/client/lib/libclntsh.so \
	&& mkdir /config \
	&& touch /config/tnsnames.ora \
	&& chmod 777 /config/tnsnames.ora \
	&& rm -rf /var/cache/yum/x86_64 \
	&& rm -rf /var/cache/yum/i686 \
	&& yum clean all \
	&& ln -s /lib64/libnsl.so.2 /lib64/libnsl.so.1

ENV ORACLE_HOME=/usr/lib/oracle/${INSTANT_CLIENT_VERSION}/client \
    TNS_ADMIN=/config/ \
    LD_LIBRARY_PATH="/usr/lib/oracle/${INSTANT_CLIENT_VERSION}-/client/lib:${LD_LIBRARY_PATH}:/lib64"  \
    PATH="/usr/lib/oracle/${INSTANT_CLIENT_VERSION}-/client/bin:${PATH}" \
    LANG=en_US.UTF-8 
