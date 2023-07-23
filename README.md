# OpenClassroom-AIC-Projet-6

Script de Sauvegarde pour plusieur container docker

Installation

1 / Initialisation de AWS CLI S3

sudo apt udpate
sudo apt install awscli
aws configure

2 / Création du Bucket S3

aws s3api create-bucket --bucket SauvegardeDocker --region eu-west-1

3 / Identificaiton des chemins des container

Le but va etre de voir ou sont les fichier de configuration pour mieux les sauvegarders
Il suffira de modifier les divers noms des containers et des chemin de dossier