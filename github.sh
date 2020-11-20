#!/usr/bin/env bash

git config --global user.name "Fabio Ribeiro"
git config --global user.email rib3iro@live.com
git config --global core.editor vim
echo "--------------------------------------------"
git config --list
echo "--------------------------------------------"
echo "# ubuntu" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/frib3iro/ubuntu.git
git push -u origin main
