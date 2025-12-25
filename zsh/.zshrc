fastfetch
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

for f in ~/.dotfiles/zsh-scripts/*.zsh
do
	if [[ "$f" != *"keybinds.zsh" ]]; then
		source $f
	fi
done


export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin

autoload -U add-zsh-hook

# fnm
if command -v fnm &> /dev/null
then
  eval "$(fnm env --use-on-cd)"
fi


# zsh completions
fpath=(~/.zsh/zsh-completions $fpath)
alias :q=exit
alias :qa=exit
alias :wq=exit
alias :wqa=exit

alias lg=lazygit

alias vim=nvim
alias siopao=bun
alias siopaox=bunx

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="/usr/local/sbin:$PATH"

autoload bashcompinit
bashcompinit

[ -s "/opt/vcpkg/scripts/vcpkg_completion.zsh" ] && source /opt/vcpkg/scripts/vcpkg_completion.zsh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# luarocks
if [[ $(uname) == "Darwin" ]]; then
	export PATH="/usr/local/bin:/usr/local/opt/python/libexec/bin:$PATH"
fi

source ~/.dotfiles/zsh-scripts/keybinds.zsh

# fnm
FNM_PATH="/home/rek/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# bun completions
[ -s "/home/rek/.bun/_bun" ] && source "/home/rek/.bun/_bun"
