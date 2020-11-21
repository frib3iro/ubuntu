#!/usr/bin/env bash

amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

clear
echo -e "${seta} ${ciano}Baixando o tema Dracula${fim}"
sleep 2

if [ $(ls dracula* >/dev/null 2>&1; echo $?) -eq 0 ]
then
    echo -e "${seta} ${ciano}Arquivos existem e serão excluídos${fim}"
    sleep 2
    rm dracula.xml*
    wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
else
    echo -e "${seta} ${ciano}Arquivos não existem${fim}"
    sleep 2
    wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
fi

echo -e "${seta} ${ciano}Clonando temas do github${fim}"
sleep 2
if [ -d "gedit-themes" ]
then
    rm -rf gedit-themes
else
    git clone https://github.com/mig/gedit-themes.git
fi

echo -e "${seta} ${ciano}Verificando se o diretório styles existe${fim}"
sleep 2
if [ -d "/home/fabio/.local/share/gedit/styles" ]
then
    echo -e "${seta} ${amarelo}O diretório styles existe, apenas movendo os temas${fim}"
    sleep 2
    mv dracula.xml /home/fabio/.local/share/gedit/styles/
    mv /home/fabio/gedit-themes/*.xml /home/fabio/.local/share/gedit/styles/
else
    echo -e "${seta} ${amarelo}Criando o diretório styles e movendo os temas${fim}"
    sleep 2
    mkdir -p /home/fabio/.local/share/gedit/styles
    mv dracula.xml /home/fabio/.local/share/gedit/styles/
    mv /home/fabio/gedit-themes/*.xml /home/fabio/.local/share/gedit/styles/
fi

echo -e "${seta} ${ciano}Removendo arquivos baixados${fim}"
sleep 2
rm -rf gedit-themes

