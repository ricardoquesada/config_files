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

# Fixes for brew
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# depot tools
# export PATH=~/bin/depot_tools:"$PATH"

#
# show git branch
#
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[00m\]\u@\h\[\033[01;33m\] \w \[\033[31m\]\$(parse_git_branch)\[\033[00m\]$\[\033[00m\] "

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

export PATH="${PATH}:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$NDK_ROOT:~/androiddev/apache-ant-1.9.4/bin:~/androiddev/fplutil/bin:"


#
# cocos2d
#
export CLANG_ROOT=~/bin/clang+llvm-3.3-x86_64-apple-darwin12

#
# Qt
#
QT_PATH=~/Qt/5.4/clang_64/bin
export PATH="${PATH}$QT_PATH"


# Marmalade SDK addition: please do not edit these lines
export PATH=$PATH:"/Users/riq/Applications/Marmalade.app/Contents/s3e/bin"
export S3E_DIR=/Users/riq/Applications/Marmalade.app/Contents/s3e
# Marmalade SDK addition: end

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
#export COCOS_CONSOLE_ROOT=/Users/riq/progs/cocos2d-x/tools/cocos2d-console/bin
export COCOS_CONSOLE_ROOT=/Users/riq/progs/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/Applications/Cocos/tools/ant/bin
export PATH=$ANT_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/frameworks/cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/riq/progs/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
