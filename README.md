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

# aliases
rm -rf ~/.aliases && ln -s ~/workspace/dotfiles/.aliases ~/.aliases
rm -rf ~/.bash_profile && ln -s ~/workspace/dotfiles/.bash_profile ~/.bash_profile
rm -rf ~/.bash_prompt && ln -s ~/workspace/dotfiles/.bash_prompt ~/.bash_prompt
rm -rf ~/.bashrc && ln -s ~/workspace/dotfiles/.bashrc ~/.bashrc
rm -rf ~/.exports && ln -s ~/workspace/dotfiles/.exports ~/.exports
rm -rf ~/.functions && ln -s ~/workspace/dotfiles/.functions ~/.functions
rm -rf ~/.gitignore && ln -s ~/workspace/dotfiles/.gitignore ~/.gitignore
rm -rf ~/.profile && ln -s ~/workspace/dotfiles/.profile ~/.profile
rm -rf ~/.tmux.conf && ln -s ~/workspace/dotfiles/.tmux.conf ~/.tmux.conf
rm -rf ~/.vimrc && ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
rm -rf ~/.zshrc && ln -s ~/workspace/dotfiles/.zshrc ~/.zshrc
rm -rf ~/.zfunctions && ln -s ~/workspace/dotfiles/.zfunctions ~/.zfunctions
rm -rf ~/.vim && ln -s ~/workspace/dotfiles/.vim ~/.vim
rm -rf ~/.config && ln -s ~/workspace/dotfiles/.config ~/.config
rm -rf ~/screen-256color-it.terminfo && ln -s ~/workspace/dotfiles/screen-256color-it.terminfo ~/screen-256color-it.terminfo
tic ~/screen-256color-it.terminfo

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```
