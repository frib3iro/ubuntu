#!/usr/bin/env bash

# variaveis e password
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

# Instalando o ZSH
if sudo apt install zsh -y
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Instalando o Oh My Zsh${fim}"
if [ -d "/home/fabio/.oh-my-zsh" ]
then
    echo "${seta} ${vermelho}O diretório existe e será excluído!${fim}"
    rm -rf /home/fabio/.oh-my-zsh
    sh ./ohmyzsh.sh
else
    echo "${seta} ${vermelho}O diretório não existe e será criado!${fim}"
    sh ./ohmyzsh.sh
fi

echo "${seta} ${ciano}Mudando o bash pelo zsh para $(whoami)${fim}"
sleep 2
if sudo usermod -s /usr/bin/zsh $(whoami) > /dev/null 2>&1
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Mudando o bash pelo zsh para root${fim}"
sleep 2
if sudo usermod -s /usr/bin/zsh root > /dev/null 2>&1
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Instalando o syntax-highlighting${fim}"
sleep 2
if git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Habilitando a configuração de Syntax Highlighting no zsh${fim}"
sleep 2
if sed -i 's/plugins=()/plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)/' /home/fabio/.zshrc
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Instalando o Oh My Zsh-autosuggestion${fim}"
sleep 2
if git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Instalando o fzf${fim}"
sleep 2
if [ -d "/home/fabio/.fzf" ]
then
    echo "${seta} ${vermelho}O diretório existe e será excluído!${fim}"
    rm -rf /home/fabio/.fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/yes | .fzf/install
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/yes | .fzf/install
fi

