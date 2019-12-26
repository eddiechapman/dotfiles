# Dotfiles




## Fresh install

Install:
- git
- vim
- curl
- pip
- Python dev libraries
- venv

```sh
sudo apt install -y git vim curl python3-pip build-essential libssl-dev libffi-dev python-dev python3-venv
```

Clone the dotfiles repository

```sh
git clone https://www.github.com/eddiechapman/dotfiles.git
cd dotfiles
```

Create a folder for vim plugins in `~/dotfiles/.vim/autoload`

```sh
mkdir .vim
cd .vim
mkdir autoload
```

Create/overwrite existing dotfiles with symbolic links to the dotfiles directory

Use absolute path names.

```sh
cd ..  # back to home ~
ln -s /home/eddie/dotfiles/.bashrc /home/eddie/.bashrc
source /home/eddie/.bashrc
ln -s /home/eddie/dotfiles/.git_profile /home/eddie/.git_profile
ln -s /home/eddie/dotfiles/.vimrc /home/eddie/.vimrc
ln -s /home/eddie/dotfiles/.vim /home/eddie/.vim
ln -s /home/eddie/dotfiles/.startup.py /home/eddie/.startup.py
```

Run vim in the home directory to load configuration and download plugins.

```sh
vim
```
