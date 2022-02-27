# compilers, terminal, etc
sudo pacman -Syu base-devel --needed

sudo pacman -Syu git mercurial meson autoconf automake ninja cmake make
sudo pacman -Syu strace neovim tmux wget mc meld
sudo pacman -Syu htop

# nvim related
sudo pacman -Syu ripgrep curl xclip fuse
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade msgpack


# CADs
# FreeCAD deb is broken: install it manually from their webpage
# KiCAD: deb works Ok, but "official" one has latest version in .deb
sudo pacman -Syu blender openscad

# Games
sudo pacman -Syu steam

# Vice
sudo pacman -Syu dos2unix gawk xa

# misc
sudo pacman -Syu evtest evemu minicom powerline

# atool
sudo pacman -Syu arj lzip pbzip2 bzip2 p7zip tar file lzip

# Utils
sudo pacman -Syu binwalk hexer cpio

