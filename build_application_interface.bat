@echo off
SET IMAGE_NAME=siebel_17_sai

docker image rm %IMAGE_NAME%
docker build -f ./3_application_interface/Dockerfile -t %IMAGE_NAME% .