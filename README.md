# dotfiles
dotfiles

## Install

```bash
# use brew zsh
brew install zsh
sudo vim /etc/shells # /usr/local/bin/zsh
# fix insecure directories
# for f in $(compaudit);do sudo chmod -R 755 $f;done;

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# tmux
# brew install tmux
git clone https://github.com/tmux/tmux.git
cd tmux
# modify this file => tty.c:#define TTY_BLOCK_INTERVAL (16666 /* 60fps */)
sh autogen.sh
./configure && make && sudo make install

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
brew install --HEAD neovim

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Dotfiles
cd ~
mkdir workspace
cd workspace
git clone https://github.com/josex2r/dotfiles.git
cd ~

# stow
brew install stow
stow --verbose alacritty
stow --verbose aliases
stow --verbose bash
stow --verbose exports
stow --verbose functions
stow --verbose git
stow --verbose karabiner
stow --verbose nvim
stow --verbose tmux
stow --verbose zsh
rm -rf ~/.vimrc && ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
rm -rf ~/.config && ln -s ~/workspace/dotfiles/.config ~/.config

tic ./screen-256color-it.terminfo

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```
