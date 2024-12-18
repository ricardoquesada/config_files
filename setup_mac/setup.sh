# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install fzf
brew install fd

brew install git tmux
brew install cmake pkgconfig libusb

# From here: https://www.josean.com/posts/7-amazing-cli-tools
mkdir -p ~/src/misc/
cd ~/src/misc/
git clone https://github.com/junegunn/fzf-git.sh.git

# better cat
brew install bat
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
bat cache --build

# better git-diff
brew install git-delta
# better ls
brew install eza
# friendly man pages
brew install tlrc
# when you misstype the command
brew install thefuck
# better cd
brew install zoxide
# fonts
brew install font-meslo-lg-nerd-font 

# Installing dependencies using Homebrew
brew install ripgrep the_silver_searcher perl universal-ctags
