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

export ZSH=$HOME/.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh


source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source "$HOME/.dotfiles/zsh-scripts/256color.zsh"
source "$HOME/.dotfiles/zsh-scripts/calc.zsh"
source "$HOME/.dotfiles/zsh-scripts/directories.zsh"
source "$HOME/.dotfiles/zsh-scripts/fnm_completions.zsh"
source "$HOME/.dotfiles/zsh-scripts/history.zsh"
source "$HOME/.dotfiles/zsh-scripts/render-md.sh"


export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.dotnet/tools
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export HOMEBREW_NO_AUTO_UPDATE=1 

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
function gp {
  git pull
}

function gP {
  git push
}

function gc {
  if [[ $1 = '' ]]; then
    echo 'ERROR: You must supply a commit message' >&2
    return 1
  fi
  git commit -m "$1"
}

alias lg=lazygit

alias vim=nvim
alias siopao=bun
alias siopaox=bunx
alias lg=lazygit

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
	export PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/bin:$PATH"
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
# bun completions
[ -s "/Users/rek/.bun/_bun" ] && source "/Users/rek/.bun/_bun"


export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Android/cmdline-tools/bin"
export PATH="$PATH:/usr/local/share/android-commandlinetools/platform-tools"

export ANDROID_SDK_ROOT="$HOME/Android"

export GPG_TTY=$(tty)

# opencode
export PATH=/home/rek/.opencode/bin:$PATH
