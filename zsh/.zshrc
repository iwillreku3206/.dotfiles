# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autocomplete zsh-autosuggestions dotenv)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin

autoload -U add-zsh-hook

# fnm
eval "$(fnm env --use-on-cd)"

# zsh completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source "$HOME/.dotfiles/zsh-scripts/fnm_completions.zsh"
alias :q=exit
alias :qa=exit
alias :wq=exit
alias :wqa=exit

alias vim=nvim
alias siopao=bun
alias siopaox=bunx

source ~/.dotfiles/zsh-scripts/*.sh
pfetch

#export MSBuildSDKsPath=$( echo /usr/share/dotnet/sdk/7.*/Sdks );

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="/usr/local/sbin:$PATH"

autoload bashcompinit
bashcompinit

[ -s "/opt/vcpkg/scripts/vcpkg_completion.zsh" ] && source /opt/vcpkg/scripts/vcpkg_completion.zsh

# bun completions
[ -s "/home/rek/.bun/_bun" ] && source "/home/rek/.bun/_bun"

# bun completions
[ -s "/Users/rek/.bun/_bun" ] && source "/Users/rek/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# luarocks
if [[ $(uname) == "Darwin" ]]; then
	export PATH="/usr/local/bin:/usr/local/opt/python/libexec/bin:$PATH"
fi
