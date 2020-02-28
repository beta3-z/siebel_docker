FROM siebel_17_sai

RUN mkdir -p /config /Siebel_Install_Image
COPY 7_update_application_interface/config /config
COPY Siebel_IP19_Install_Image /Siebel_Install_Image

RUN /config/install.sh
