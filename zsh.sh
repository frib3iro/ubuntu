#!/usr/bin/env bash

# variaveis e password
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

clear
echo -e "${seta} ${ciano}Bem vindo a instalação e configuração do zsh${fim}"
sleep 2s

echo -e "${seta} ${ciano}Atualizando...${fim}"
sleep 2s
if sudo apt update && sudo apt upgrade -y
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${seta} ${ciano}Instalando o ZSH${fim}"
sleep 2s
if sudo apt install zsh -y
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${ciano}Mudando o bash pelo zsh para $(whoami)${fim}"
if sudo usermod -s /usr/bin/zsh $(whoami)
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${ciano}Mudando o bash pelo zsh para root${fim}"
if sudo usermod -s /usr/bin/zsh root
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

source ohmyzsh.sh

echo -e "${ciano}Instalando o syntax-highlighting${fim}"
sleep 2s
if sudo apt install zsh-syntax-highlighting -y
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${ciano}Habilite a configuração de Syntax Highlighting no zsh${fim}"
sleep 2s
if echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${ciano}Instalando o Oh My Zsh-autosuggestion${fim}" 
sleep 2s
if sudo apt-get install zsh-autosuggestions -y
then
    echo -e "${verde}Sucesso!${fim}"
else
    echo -e "${vermelho}Falhou!${fim}"
fi

echo -e "${ciano}Baixando e instalando o fzf${fim}"
sleep 2s
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
echo y
echo y
echo y

