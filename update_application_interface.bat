@echo off
SET IMAGE_NAME=siebel_19.12_sai

echo ---remove old image (if exists)---

docker image rm %IMAGE_NAME%

echo ---build %IMAGE_NAME% image---

docker build -f ./7_update_application_interface/Dockerfile -t %IMAGE_NAME% --squash .