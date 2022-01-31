#!/bin/bash

# set symbolic links to the dotfiles
cd
ln -s dotfiles/.zshrc . 
ln -s dotfiles/.tmux.conf .
ln -s dotfiles/.gitconfig . 
ln -s dotfiles/.vimrc . 

# download vim-plug for vim and nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install nvm, latest node, and pyright language server
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # this loads nvm
nvm install node  # this installs latest node
npm install -g pyright

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install Rust (rustc, cargo, rustup) and useful libraries
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$HOME/.cargo/bin/cargo install fd-find
$HOME/.cargo/bin/cargo install procs
$HOME/.cargo/bin/cargo install ripgrep
$HOME/.cargo/bin/cargo install --locked bat
$HOME/.cargo/bin/cargo install exa
$HOME/.cargo/bin/cargo install git-delta
