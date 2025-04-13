# dotfiles

## Install brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install zsh + prompt

```bash
# use brew zsh
brew install zsh
brew install zoxide

# M1 - Set default terminal
chsh -s /opt/homebrew/bin/zsh

# Intel - Set default terminal
sudo vim /etc/shells # /usr/local/bin/zsh

# fix insecure directories
# for f in $(compaudit);do sudo chmod -R 755 $f;done;
```

## Install tmux

```bash
brew install tmux
brew install reattach-to-user-namespace

# Add tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install fonts

```bash
cp -r "fonts/*" ~/Library/Fonts
```

## Install cli tools

```bash
brew install sqlite # optional, depends on OS
brew install ripgrep
brew install gsed
brew install fzf
# brew install --HEAD neovim
brew install neovim
```

## Install mise (rtx)

```bash
curl https://mise.run | sh
```

## Setup dotfiles

```bash
cd ~

git clone https://github.com/josex2r/dotfiles.git

# stow
cd ~/dotfiles
brew install stow

stow --verbose git
stow --verbose mise
stow --verbose nvim
stow --verbose rancher
stow --verbose tmux
stow --verbose zsh

# Allow italics in terminal+nvim
tic ./screen-256color-it.terminfo
tic -x ./tmux-256color.terminfo
```
