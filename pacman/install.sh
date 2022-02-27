# compilers, terminal, etc
sudo pacman -S clang gdb gcc llvm nasm lldb
#golang rustc clang-format clangd

sudo pacman -S git mercurial meson autoconf automake ninja cmake make
sudo pacman -S strace neovim tmux wget mc meld
sudo pacman -S htop

# nvim related
sudo pacman -S ripgrep curl xclip fuse
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade msgpack


# CADs
# FreeCAD deb is broken: install it manually from their webpage
# KiCAD: deb works Ok, but "official" one has latest version in .deb
sudo pacman -S blender openscad

# Games
sudo pacman -S steam

# Vice
sudo pacman -S dos2unix gawk xa

# misc
sudo pacman -S evtest minicom powerline

# atool
sudo pacman -S arj lzip pbzip2 bzip2 p7zip tar file lzip

# Utils
sudo pacman -S binwalk hexer cpio

