#!/usr/bin/env bash

verde='\e[32;1m'
vermelho='\e[31;1m'
amarelo='\e[33;1m'
ciano='\033[0;36m'
fim='\e[m'
seta='\e[32;1m==>\e[m'

# Descrição dos pacotes
# qemu-kvm ---------------- software que fornece emulação de hardware para o hipervisor KVM.
# libvirt-daemon-system --- arquivos de configuração para executar o daemon libvirt como um serviço do sistema.
# libvirt-clients --------- software para gerenciamento de plataformas de virtualização.
# bridge-utils ------------ um conjunto de ferramentas de linha de comando para configurar pontes Ethernet.
# virtinst ---------------- um conjunto de ferramentas de linha de comando para criar máquinas virtuais.
# virt-manager ------------ uma interface GUI fácil de usar e utilitários de linha de comando de suporte para gerenciar máquinas virtuais por meio de libvirt.

clear
echo -e "${seta} ${ciano}Instalando KVM no Ubuntu${fim}"
sleep 2

echo -e "${seta} ${ciano}Instalando o KVM e pacotes adicionais de gerenciamento de virtualização${fim}"
sleep 2
if sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
then
    echo -e "${seta} ${verde}Sucesso!${fim}"
    sleep 2
else
    echo -e "${seta} ${vermelho}Falhou${fim}"
    sleep 2
    exit 1
fi

echo -e "${seta} ${ciano}Daemon libvirt será iniciado automaticamente${fim}"
sleep 2
if sudo systemctl is-active libvirtd
then
    echo -e "${seta} ${verde}Sucesso!${fim}"
    sleep 2
else
    echo -e "${seta} ${vermelho}Falhou${fim}"
    sleep 2
    exit 1
fi

echo -e "${seta} ${ciano}Adicionando seu usuário aos grupos libvirt e kvm${fim}"
sleep 2
if sudo usermod -aG libvirt $USER && sudo usermod -aG kvm $USER
then
    echo -e "${seta} ${verde}Sucesso!${fim}"
    sleep 2
else
    echo -e "${seta} ${vermelho}Falhou${fim}"
    sleep 2
    exit 1
fi
