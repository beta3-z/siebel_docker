#!/bin/bash
# e.g. ./keygen -r .. -s mypass -d *.company.com -c my-custom-ca 2>&1 | tee keygen.log
# https://github.com/OracleSiebel/ConfiguringSiebel/blob/master/Containerization/Docker/ol7/manage/SSL/Keys/keygen
# bash keygen -r .. -s siebel -d *.company.com -c my-custom-ca 2>&1 | tee keygen.log
usage() { echo "Usage: $0 [-r <SSL Script Root>] [-s <storepass>] [-d <domain>] [-c <CA Name>]" 1>&2; exit 1; }

while getopts r:s:d:c: option
do
 case "${option}"
 in
 r)  ROOT=${OPTARG};;
 s)  STOREPASS=${OPTARG};;
 d)  DOMAIN=${OPTARG};;
 c)  CANAME=${OPTARG};;
 *)  usage;;
 esac
done

if [ -z "${ROOT}" ] || [ -z "${STOREPASS}" ] || [ -z "${DOMAIN}" ] || [ -z "${CANAME}" ] ; then
    usage
fi

SAN=DNS.1:${DOMAIN}

rm ${ROOT}/Keys/siebelkeystore.jks

keytool -genkey -alias siebel -keystore ${ROOT}/Keys/siebelkeystore.jks -keyalg RSA -sigalg SHA256withRSA -dname "cn=${DOMAIN}" -storepass ${STOREPASS} -keypass ${STOREPASS}
keytool -list -v -keystore ${ROOT}/Keys/siebelkeystore.jks -storepass ${STOREPASS} -keypass ${STOREPASS}
keytool -certreq -alias siebel -keystore ${ROOT}/Keys/siebelkeystore.jks -file ${ROOT}/Keys/siebelkeystore.csr -storepass ${STOREPASS} -keypass ${STOREPASS}

openssl req -newkey rsa:2048 -keyout ${ROOT}/CA/cakey.pem -out ${ROOT}/CA/careq.pem -subj "/CN=${CANAME}" -sha256 -passout pass:${STOREPASS}
openssl x509 -signkey ${ROOT}/CA/cakey.pem -req -days 3650 -in ${ROOT}/CA/careq.pem -out ${ROOT}/CA/caroot.cer -extfile v3.txt -passin pass:${STOREPASS}
keytool -printcert -v -file ${ROOT}/CA/caroot.cer
sed -e "s/SAN/${SAN}/" ${ROOT}/Keys/ext.tmpl > ${ROOT}/Keys/ext.cnf
openssl x509 -CA ${ROOT}/CA/caroot.cer -CAkey ${ROOT}/CA/cakey.pem -CAserial ${ROOT}/CA/serial.txt -req -in ${ROOT}/Keys/siebelkeystore.csr -out ${ROOT}/Keys/siebelkeystoreCASigned.cer -days 3650 -extfile ${ROOT}/Keys/ext.cnf -passin pass:${STOREPASS}

keytool -import -alias ca -file ${ROOT}/CA/caroot.cer -keystore ${ROOT}/Keys/siebelkeystore.jks -storepass ${STOREPASS} -keypass ${STOREPASS} -noprompt
keytool -import -alias siebel -file ${ROOT}/Keys/siebelkeystoreCASigned.cer -keystore ${ROOT}/Keys/siebelkeystore.jks -storepass ${STOREPASS} -keypass ${STOREPASS}
keytool -list -v -keystore ${ROOT}/Keys/siebelkeystore.jks -storepass ${STOREPASS} -keypass ${STOREPASS}