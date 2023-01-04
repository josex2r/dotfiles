# dotfiles

## Install brew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install zsh + prompt

```bash
# use brew zsh
brew install zsh

# M1
chsh -s /opt/homebrew/bin/zsh

# Intel
sudo vim /etc/shells # /usr/local/bin/zsh

# fix insecure directories
# for f in $(compaudit);do sudo chmod -R 755 $f;done;
```

## Install tmux

```bash
brew install tmux
```

### Build tmux & speedup render in Alacritty

```bash
git clone https://github.com/tmux/tmux.git
cd tmux
# modify this file => tty.c:#define TTY_BLOCK_INTERVAL (16666 /* 60fps */)
sh autogen.sh
./configure && make && sudo make install
```

### Add tmux plugin manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install fonts

```bash
cp -r "fonts/*" ~/Library/Fonts
```

## Install neovim

```bash
brew install --HEAD neovim
```

## Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install asdf

```bash
brew install asdf
# install plugins like node, python, ...
```

## Install fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
``

## Setup dotfiles

```bash
cd ~

git clone https://github.com/josex2r/dotfiles.git

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

# Allow italics in terminal+nvim
tic ./screen-256color-it.terminfo
```
