#!/usr/bin/env bash

# variaveis e password
pass_user='123'
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
ciano='\033[0;36m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

echo "${seta} ${ciano}Copiando .zshrc para /root${fim}"
sleep 2
if sudo cp /home/fabio/ubuntu/.zshrc /home/fabio && sudo cp /home/fabio/.zshrc /root
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Copiando .vim para /root${fim}"
sleep 2
if sudo cp -r /home/fabio/ubuntu/.vim /home/fabio && sudo cp -r /home/fabio/.vim /root
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Copiando .oh-my-zsh para /root${fim}"
sleep 2
if sudo cp -r /home/fabio/.oh-my-zsh /root
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Copiando o vimrc para /root${fim}"
sleep 2
if sudo cp /home/fabio/ubuntu/.vimrc /home/fabio && sudo cp /home/fabio/.vimrc /root
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${ciano}Editando o arquivo .zshrc${fim}"
sleep 2
if sudo sed -i 's#export ZSH="/home/fabio/.oh-my-zsh"#export ZSH="/root/.oh-my-zsh"#g' /root/.zshrc
then
    echo "${seta} ${verde}Sucesso!${fim}"
else
    echo "${seta} ${vermelho}Falhou!${fim}"
fi

echo "${seta} ${verde}Operação concluída!${fim}"

