#
# bash improvements
#
set -o vi
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#
# local path
#
export PATH="${PATH}:$HOME/bin"

# depot tools
# export PATH=~/bin/depot_tools:"$PATH"

#
# show git branch
#
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[00m\]\u@\h\[\033[01;33m\] \w \[\033[31m\]\$(parse_git_branch)\[\033[00m\]$\[\033[00m\] "

#
# show git branch: windows
#
#__git_ps1 () 
#{ 
#    local b="$(git symbolic-ref HEAD 2>/dev/null)";
#    if [ -n "$b" ]; then
#        printf " (%s)" "${b##refs/heads/}";
#    fi
#}
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
#export PS1

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#
# Android
#
export NDK_ROOT=~/androiddev/android-ndk-r10d
#export NDK_TOOLCHAIN_VERSION=4.8
#export NDK_TOOLCHAIN_VERSION=clang
export ANDROID_SDK_ROOT=~/androiddev/adt-bundle-mac-x86_64-20140702/sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_NDK=$NDK_ROOT

