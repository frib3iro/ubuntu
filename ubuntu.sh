#!/usr/bin/env bash

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

clear
echo -e "${seta} ${ciano}Bem vindo a configuração do Ubuntu${fim}"
sleep 2

echo -e "${seta} ${ciano}Atualizando...${fim}"
sleep 3s
if sudo apt update && sudo apt upgrade -y
then
    echo -e "${seta} ${verde}Sucesso!${fim}"
else
    echo -e "${seta} ${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Instalando o Linux Mint Tool no Ubuntu${fim}"
sleep 2
wget http://packages.linuxmint.com/pool/main/m/mintstick/mintstick_1.4.1_all.deb
sudo apt install ./mintstick_1.4.1_all.deb -y
if rm mintstick_1.4.1_all.deb 2>/dev/null
then
    echo -e "${seta} ${verde}Arquivo excluído!${fim}"
else
    echo -e "${seta} ${amarelo}Arquivo não existe!${fim}"
fi

echo -e "${seta} ${ciano}Instalando KVM no Ubuntu${fim}"
sleep 2
sh ./virtmanager.sh

echo -e "${seta} ${ciano}Instalando o Git${fim}"
sleep 2
sudo apt install git -y

echo -e "${seta} ${ciano}Instalando o Vim${fim}"
sleep 2
sudo apt install vim -y

echo -e "${seta} ${ciano}Instalando o Stockfish 12${fim}"
sleep 2
wget -c https://stockfishchess.org/files/stockfish_12_linux_x64_bmi2.zip
unzip stockfish_12_linux_x64_bmi2.zip
mv stockfish_20090216_x64_bmi2 'Stockfish 12'
mkdir -p /home/fabio/Documentos/PyChess
mv 'Stockfish 12' /home/fabio/Documentos/PyChess
if rm stockfish_12_linux_x64_bmi2.zip 2>/dev/null
then
    echo -e "${seta} ${verde}Arquivo excluído!${fim}"
else
    echo -e "${seta} ${amarelo}Arquivo não existe!${fim}"
fi

echo -e "${seta} ${ciano}Instalando o Pychess${fim}"
sleep 2
wget -c https://github.com/pychess/pychess/releases/download/1.0.2/python3-pychess_1.0.2-1_all.deb
sudo apt install ./python3-pychess_1.0.2-1_all.deb -y
if rm python3-pychess_1.0.2-1_all.deb 2>/dev/null
then
    echo -e "${seta} ${verde}Arquivo excluído!${fim}"
else
    echo -e "${seta} ${amarelo}Arquivo não existe!${fim}"
fi

echo -e "${seta} ${ciano}Instalando o openssh-server${fim}"
sleep 2
sudo apt-get install openssh-server -y
echo -e "${seta} ${ciano}Iniciando o serviço ssh${fim}"
sleep 2
sudo service ssh start
# Para ver o ip: --> ip a
# Utilização: --> ssh nomeusuario@ip -p 22
# O sss utiliza a porta 22 por padrão

echo -e "${seta} ${ciano}Instalando o Google Chrome${fim}"
sleep 2
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
if rm google-chrome-stable_current_amd64.deb 2>/dev/null
then
    echo -e "${seta} ${verde}Arquivo excluído!${fim}"
else
    echo -e "${seta} ${amarelo}Arquivo não existe!${fim}"
fi

echo -e "${seta} ${ciano}Instalando o ZSH${fim}"
sleep 2
sh ./zsh.sh

echo -e "${seta} ${ciano}Copiando as configurações para o root${fim}"
sleep 3s
sh ./root.sh

echo -e "${seta} ${ciano}Fazendo a limpeza${fim}"
sleep 2
sudo apt autoremove -y
sudo apt clean -y
sudo apt autoclean -y

echo -e "${seta} ${ciano}Excluindo arquivos install criados!${fim}"
if rm install.sh* 2>/dev/null
then
    echo -e "${seta} ${amarelo}Arquivos excluídos!${fim}"
else
    echo -e "${seta} ${amarelo}Arquivos não existem!${fim}"
fi

echo -e "${seta} ${verde}Configuração finalizada!${fim}"

