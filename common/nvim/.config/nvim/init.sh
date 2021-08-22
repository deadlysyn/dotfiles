#!/bin/sh

# plugin manager
git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

yarn global add bash-language-server
yarn global add vscode-css-languageserver-bin
go get golang.org/x/tools/gopls@latest
yarn global add vscode-html-languageserver-bin
yarn global add vscode-json-languageserver
yarn global add pyright
brew install rust-analyzer
yarn global add sql-language-server
yarn global add typescript typescript-language-server
yarn global add vim-language-server
yarn global add vls
yarn global add yaml-language-server

# Lua LSP
cd ~/bin
wget https://hub.fastgit.org/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip
unzip ninja*zip
rm ninja*zip
cd ~/src
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
cp bin/Linux/lua-language-server ~/bin

echo "Run `nvim +PackerInstall` to finish setup"
