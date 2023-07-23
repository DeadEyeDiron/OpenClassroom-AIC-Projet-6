#!/bin/bash

echo "Lancement du script de sauvegarde Docker"

#Création des dossier suviant
mkdir /saveDocker/WP-Vitrine
mkdir /saveDocker/WP-Intranet
mkdir /saveDocker/Dolibarr

#Sauvegarde de DOCKER 1
docker stop WpVitrine
tar -cvf /saveDocker/WPVitrine.tar  /DockerRepertoire/WpVitrine
docker start WpVitrine

#Sauvegarde de DOCKER 1
docker stop WpIntranet
tar -cvf /saveDocker/WPIntranet.tar  /DockerRepertoire/WpVitrine
docker start WpIntranet

#Sauvegarde de DOCKER 1
docker stop Dolibarr
tar -cvf /saveDocker/Dolibarr.tar  /DockerRepertoire/Dolibarr
docker start Dolibarr

#Suppression des dossier
rm -r /saveDocker/WP-Vitrine
rm -r /saveDocker/WP-Intranet
rm -r /saveDocker/Dolibarr

#Compression de sauvegarde
zip -r /SaveDocker.zip /saveDocker

#Modifier Le nom avec la date
ladate=`date +%Y_%m_%d`
chemin=/awstransfer
mv /SaveDocker.zip  $chemin/$ladate+Savedocker.zip

#Transfert vers S3
aws s3 mv awstransfer/$ladate+Savedocker.zip s3://VersMonbuketS3

#Suppression des Archive
rm -r /saveDocker/WPVitrine.tar 
rm -r /saveDocker/WPIntranet.tar 
rm -r /saveDocker/Dolibarr.tar 

