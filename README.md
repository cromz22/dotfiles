# dotfiles

## Requirements

- Git >= 2.7.0 (for brew)
- bash

## Installation

1. Install Git and setup connections to GitHub

1. Clone this repository at `${HOME}`

	```
	cd
	git clone git@github.com:cromz22/dotfiles.git
	```

1. Execute `install.sh`. This script creates symlinks to the dotfiles and installs the following tools and some useful tools that can be installed with them.

	- [vim-plug](https://github.com/junegunn/vim-plug) (only for vim) 
	- [nvm](https://github.com/nvm-sh/nvm)
	- [Rust](https://www.rust-lang.org/tools/install)

	```
	cd dotfiles
	bash install.sh
	```

1. Install [neovim](https://github.com/neovim/neovim) somewhere and set PATH

	- If you have brew, `brew install nvim`
	- Else, install from tarball
	- Open nvim/vim and type `:PlugInstall`
