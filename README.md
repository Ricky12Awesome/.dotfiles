# .dotfiles

This repo contains my dotfiles that I use for linux

This project uses [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles

## Install

```sh
git clone https://github.com/Ricky12Awesome/.dotfiles
cd .dotfiles
git submodule update --init
./install.sh
```

if you want to revert back to your old configs run `./uninstall.sh`
