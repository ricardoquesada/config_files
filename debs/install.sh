# compilers, terminal, etc
sudo apt install clang-format clang gdb gcc g++ llvm clangd golang rustc nasm lldb
sudo apt install git mercurial meson autoconf automake ninja-build make
sudo apt install strace neovim tmux wajig wget curl mc ripgrep silversearcher-ag
sudo apt install htop

# GUI tools
sudo apt install wireshark meld 

# nvim related
sudo apt install exuberant-ctags python3-dev fonts-powerline python3-pip xclip fuse
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade msgpack

# bluepad32 related
sudo apt install libusb-1.0-0-dev libhidapi-dev

# CADs
# FreeCAD deb is broken: install it manually from their webpage
# KiCAD: deb works Ok, but "official" one has latest version in .deb
sudo apt install blender openscad

# Games
sudo apt install steam

# Vice
sudo apt install dos2unix xa65 libsdl2-dev libsdl2-image-dev libpng-dev libgtk-3-dev libglew-dev gawk

# misc
sudo apt install fonts-roboto evtest libjpeg-dev libcurl4-openssl-dev libminizip-dev minicom powerline tio

# atool
sudo apt install arj lzip pbzip2 bzip2 rar p7zip tar file lzip atool

# Utils
sudo apt install binwalk hexer lzma cpio

# At the end, make sure that python is Python3
sudo apt install python-is-python3
