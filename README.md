# OpenClassroom-AIC-Projet-6

Script de Sauvegarde pour plusieur container docker

## Installation

### 1 / Initialisation de AWS CLI S3
```bash
sudo apt udpate
sudo apt install awscli
aws configure
```
### 2 / Création du Bucket S3
```bash
aws s3api create-bucket --bucket SauvegardeDocker --region eu-west-1
```
### 3 / Identificaiton des chemins des container

Le but va etre de voir ou sont les fichier de configuration pour mieux les sauvegarders
Il suffira de modifier les divers noms des containers et des chemin de dossier

## Automatisation

On se sert de Crontab avec une alerte mail pour nous envoyer le résultat complet du script

## 1 / Ouverture de l'éditeur de Crontab
```bash
crontab -e
```
## 2 / Modification de Crontab
```bash
MAILTO="User@MonDomaine.fr"
05 2 * *  * /ScriptSauvegarde.sh
```
