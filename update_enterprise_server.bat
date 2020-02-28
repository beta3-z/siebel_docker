@echo off
SET IMAGE_NAME=siebel_19.12_ses

echo ---remove old image (if exists)---

docker image rm %IMAGE_NAME%

echo ---build %IMAGE_NAME% image---

docker build -f ./8_update_enterprise_server/Dockerfile -t %IMAGE_NAME% --squash .