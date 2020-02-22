FROM centos

ARG JDK=jre-8u241-linux-i586.tar.gz
ARG TEMP=/usr/tmp

COPY $JDK $TEMP

RUN mkdir /jdk && \
	tar -xf $TEMP/$JDK -C /jdk && \
	rm $TEMP/$JDK

#RUN yum install -y java-1.8.0-openjdk

# X11
RUN yum install -y xorg-x11-server-Xvfb \
	xdpyinfo

# IP16
RUN yum install -y --skip-broken \
	libnsl.i686 \
	libXtst.i686

# IP19 ?
RUN yum install -y --skip-broken \
	libgcc.i686 \
	libxcb.i686 \
	libX11.i686 \
	libXext.i686 \
	libXau.i686 \
	libcurl.i686

RUN rm -rf /var/cache/yum/x86_64 && \
	rm -rf /var/cache/yum/i686 \
	yum clean all

RUN groupadd -g  487 siebel && \
	useradd -m -g siebel -G siebel -u 9999  siebel
