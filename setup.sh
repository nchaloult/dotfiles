#!/bin/bash

if ! command -v brew &> /dev/null; then
    echo "Homebrew isn't installed. This script uses it to install neovim. Exiting..."
    exit 1
fi

NVIMCONFIG=$HOME/.config/nvim

# Install neovim, or update it if it's already installed.
brew install neovim

mkdir -p $NVIMCONFIG

# Install minpac.
mkdir -p $NVIMCONFIG/pack/minpac/opt
cd $NVIMCONFIG/pack/minpac/opt
git clone https://github.com/k-takata/minpac.git
cat >$NVIMCONFIG/init.vim <<EOL
packadd minpac
call minpac#init()
EOL
source $NVIMCONFIG/init.vim

# Now that minpac is installed, bring in your dotfiles and install plugins.
rm $NVIMCONFIG/init.vim
cp ./init.vim $NVIMCONFIG/init.vim
nvim --headless +PackUpdate +qa
