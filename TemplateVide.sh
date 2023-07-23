#!/bin/bash

echo "Lancement du script de sauvegarde Docker"

#Création des dossier suviant
mkdir /saveDocker/DOCKER1
mkdir /saveDocker/DOCKER2
mkdir /saveDocker/DOCKER3

#Sauvegarde de DOCKER 1
docker stop DOCKER1
tar -cvf /saveDocker/DOCKER1.tar  /Vers/Mon/Volume/Docker1
docker start DOCKER1

#Sauvegarde de DOCKER 1
docker stop DOCKER2
tar -cvf /saveDocker/DOCKER2.tar  /Vers/Mon/Volume/Docker2
docker start DOCKER2

#Sauvegarde de DOCKER 1
docker stop DOCKER3
tar -cvf /saveDocker/DOCKER3.tar  /Vers/Mon/Volume/Docker3
docker start DOCKER3

#Suppression des dossier
rm -r /saveDocker/DOCKER1
rm -r /saveDocker/DOCKER2
rm -r /saveDocker/DOCKER3

#Compression de sauvegarde
zip -r /SaveDocker.zip /saveDocker

#Modifier Le nom avec la date
ladate=`date +%Y_%m_%d`
chemin=/awstransfer
mv /SaveDocker.zip  $chemin/$ladate+Savedocker.zip

#Transfert vers S3
aws s3 mv awstransfer/$ladate+Savedocker.zip s3://VersMonbuketS3

#Suppression des Archive
rm -r /saveDocker/DOCKER1.tar 
rm -r /saveDocker/DOCKER2.tar 
rm -r /saveDocker/DOCKER3.tar 

