FROM siebel_17_gtw

RUN mkdir -p /config /Siebel_Install_Image
COPY 6_update_gateway/config /config
COPY Siebel_IP19_Install_Image /Siebel_Install_Image

RUN /config/install.sh

USER siebel
