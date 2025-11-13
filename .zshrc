# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Which plugins would you like to load?
plugins=(git)

source $ZSH/oh-my-zsh.sh

#
## User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# dotenv
source ~/.env

bindkey '^[OA' up-line-or-history
bindkey '^[OB' down-line-or-history
