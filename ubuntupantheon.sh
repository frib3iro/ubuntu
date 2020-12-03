#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script    : DebianPantheon.sh
# Descrição : Instalando o Pantheon no Debian 10
# Versão    : 0.1
# Autor     : Fabio Junior Ribeiro <rib3iro@live.com>
# Data      : 02/12/2020
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       : Apenas execute com ./DebianPantheon.sh
#----------------------------------------------------------------------
# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

## Tela de boas vindas
clear
echo -e "${seta} ${ciano}Como instalar o ambiente Pantheon no Ubuntu 18.04${fim}"
sleep 2s
read

echo -e "${seta} ${ciano}Adicione o repositório do programa${fim}"
sleep 2
sudo apt-add-repository ppa:elementary-os/stable
echo "deb http://ppa.launchpad.net/elementary-os/stable/ubuntu bionic main" | tee /etc/apt/sources.list.d/elementary.list
echo "deb-src http://ppa.launchpad.net/elementary-os/stable/ubuntu bionic main" | tee /etc/apt/sources.list.d/elementary.list
read

echo -e "${seta} ${ciano}Adicione a chave do repositório${fim}"
sleep 2
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6C8769CEDC20F5E66C3B7D37BF36996C4E1F8A59
read

echo -e "${seta} ${ciano}Atualize o gerenciador de pacotes${fim}"
sleep 2
sudo apt-get update
read

echo -e "${seta} ${ciano}instalando o programa${fim}"
sleep 2
sudo apt-get install elementary-desktop
read

