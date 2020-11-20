#!/usr/bin/env bash

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Tela de boas vindas
clear
echo -e "${seta} ${ciano}Bem vindo a configuração do Ubuntu${fim}"
sleep 2s
clear

echo -e "${seta} ${ciano}Instalando o Linux Mint Tool no Ubuntu${fim}"
sleep 2s
wget http://packages.linuxmint.com/pool/main/m/mintstick/mintstick_1.4.1_all.deb
sudo apt install ./mintstick_1.4.1_all.deb -y
rm mintstick_1.4.1_all.deb
clear

echo -e "${seta} ${ciano}Instalando o Git${fim}"
sleep 2s
sudo apt install git -y
clear

echo -e "${seta} ${ciano}Instalando o Vim${fim}"
sleep 2s
sudo apt install vim -y
clear

echo -e "${seta} ${ciano}Instalando o Stockfish 12${fim}"
sleep 2s
wget -c https://stockfishchess.org/files/stockfish_12_linux_x64_bmi2.zip
unzip stockfish_12_linux_x64_bmi2.zip
mv stockfish_20090216_x64_bmi2 'Stockfish 12'
mkdir -p /home/fabio/Documentos/PyChess
mv 'Stockfish 12' /home/fabio/Documentos/PyChess
rm stockfish_12_linux_x64_bmi2.zip
clear

echo -e "${seta} ${ciano}Instalando o Pychess${fim}"
sleep 2s
wget -c https://github.com/pychess/pychess/releases/download/1.0.2/python3-pychess_1.0.2-1_all.deb
sudo apt install ./python3-pychess_1.0.2-1_all.deb -y
rm python3-pychess_1.0.2-1_all.deb
clear

echo -e "${seta} ${ciano}Instalando o openssh-server${fim}"
sleep 2s
sudo apt-get install openssh-server -y
echo -e "${seta} ${ciano}Iniciando o serviço ssh${fim}"
sudo service ssh start
# Para ver o ip: --> ip a
# Utilização: --> ssh nomeusuario@ip -p numeroporta
clear

echo -e "${seta} ${ciano}Instalando o Google Chrome${fim}"
sleep 2s
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb
clear

echo -e "${seta} ${verde}Configuração finalizada!${fim}"
