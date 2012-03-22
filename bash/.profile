# bash like a vi
set -o vi

# VICE
#PATH="${PATH}:/Applications/VICE/tools"
#export PATH

# local bin
PATH="${PATH}:$HOME/bin"

# PS1
PS1='\h:\w \$ '
export PS1

# gvim default editor
EDITOR=~/bin/editor.sh
export EDITOR

# for ImageMagick
export MAGICK_HOME="$HOME/bin/ImageMagick"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"
