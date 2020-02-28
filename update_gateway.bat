@echo off
SET IMAGE_NAME=siebel_19.12_gtw

echo ---remove old image (if exists)---
docker image rm %IMAGE_NAME%
echo ---build %IMAGE_NAME% image---
docker build -f ./6_update_gateway/Dockerfile -t %IMAGE_NAME% --squash .