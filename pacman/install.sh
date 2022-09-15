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
sudo pacman -Syu openscad kicad kicad-library kicad-library-3d freecad

# Other editors
sudo yay -Syu blender shotcut gimp obs-studio

# Games
sudo pacman -Syu steam

# Vice
sudo pacman -Syu dos2unix gawk xa svn

# misc
sudo pacman -Syu evtest evemu minicom powerline tio

# atool
sudo pacman -Syu arj lzip pbzip2 bzip2 p7zip tar file lzip

# Utils
sudo pacman -Syu binwalk hexer cpio wireshark-qt the_silver_searcher htop

# ESP-IDF
sudo pacman -S --needed gcc git make flex bison gperf python-pip cmake ninja ccache dfu-util libusb

# Printer
sudo pacman -Syu system-config-printer hpoj
