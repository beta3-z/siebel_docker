FROM senpai

RUN mkdir -p /config /SiebelInstall_Image
COPY 2_gateway/config /config
COPY Siebel_Install_Image /Siebel_Install_Image

RUN /config/install_gateway.sh

USER siebel
