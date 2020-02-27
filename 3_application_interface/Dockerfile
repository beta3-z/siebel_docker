FROM senpai

RUN mkdir -p /config /SiebelInstall_Image
COPY 3_application_interface/config /config
COPY Siebel_Install_Image /Siebel_Install_Image

RUN /config/install.sh

USER siebel
