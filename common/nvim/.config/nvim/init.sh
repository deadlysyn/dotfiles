#!/bin/sh

# plugin manager
git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

go get golang.org/x/tools/gopls@latest

# npm i -g ansible-language-server
npm i -g bash-language-server
npm i -g coffeelint
npm i -g diagnostic-languageserver
npm i -g dockerfile-language-server-nodejs
# npm i -g pyright
npm i -g sql-language-server
npm i -g typescript typescript-language-server
npm i -g vscode-langservers-extracted

yarn global add yaml-language-server

yay -S fd
yay -S quicktype
yay -S rust-analyzer
yay -S shellcheck
yay -S shfmt
yay -S tflint-bin
yay -S terraform-ls-bin

# Lua LSP
cd ~/bin || exit
wget https://hub.fastgit.org/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip
unzip ninja*zip
rm ninja*zip
cd ~/src || exit
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server || exit
git submodule update --init --recursive
cd 3rd/luamake || exit
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

echo "Run nvim +PackerInstall to finish setup"
