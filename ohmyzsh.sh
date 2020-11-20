#!/usr/bin/env bash

# variaveis e password
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

echo -e "${seta} ${ciano}Instalando o Oh My Zsh${fim}"
sleep 2s
if sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && exit
then
	echo -e "${verde}Sucesso!${fim}"
else
	echo -e "${vermelho}Falhou!${fim}"
fi
