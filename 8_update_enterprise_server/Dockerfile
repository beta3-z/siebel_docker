FROM siebel_17_ses

RUN mkdir -p /config /SiebelI_nstall_Image
COPY 8_update_enterprise_server/config /config
COPY Siebel_IP19_Install_Image /Siebel_Install_Image

RUN /config/install.sh
