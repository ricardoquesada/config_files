# compilers, terminal, etc
sudo pacman -Syu base-devel --needed
sudo pacman -Syu go rust nasm
sudo pacman -Syu git mercurial meson autoconf automake ninja cmake make

sudo pacman -Syu strace tmux wget mc meld

# nvim related
sudo pacman -Syu neovim ripgrep curl xclip fuse
sudo pacman -Syu python-pip
pip install --user --upgrade pynvim
pip install --user --upgrade msgpack


# CADs
# FreeCAD deb is broken: install it manually from their webpage
# KiCAD: deb works Ok, but "official" one has latest version in .deb
sudo pacman -Syu blender openscad

# Games
sudo pacman -Syu steam

# Vice
sudo pacman -Syu dos2unix gawk xa

# misc
sudo pacman -Syu evtest evemu minicom powerline tio

# atool
sudo pacman -Syu arj lzip pbzip2 bzip2 p7zip tar file lzip

# Utils
sudo pacman -Syu binwalk hexer cpio wireshark-qt the_silver_searcher htop

# ESP-IDF
sudo pacman -S --needed gcc git make flex bison gperf python-pip cmake ninja ccache dfu-util libusb


