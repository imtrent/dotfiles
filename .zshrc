# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/iantrent/.oh-my-zsh"

# Path to composer installation
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Aliased commands I frequently use
alias pa='php artisan'
alias nrw='npm run watch'
alias knex:db='knex --knexfile src/knexfile.ts'

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
source /Users/iantrent/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist

# Path to ZSH autosuggestions
source /Users/iantrent/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh