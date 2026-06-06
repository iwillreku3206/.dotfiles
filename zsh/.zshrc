fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.zsh"
export GOPATH="$HOME/go"
export ANDROID_SDK_ROOT="$HOME/Android"
export BUN_INSTALL="$HOME/.bun"
export SDKMAN_DIR="$HOME/.sdkman"
export GPG_TTY=$(tty)
export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Android/cmdline-tools/bin"
export PATH="$PATH:/usr/local/share/android-commandlinetools/platform-tools"
export PATH="$HOME/.opencode/bin:$PATH"

if [[ $(uname) == "Darwin" ]]; then
        export PATH="/usr/local/bin:/usr/local/opt/python/libexec/bin:$PATH"
        export PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/bin:$PATH"
fi

source "$HOME/.dotfiles/zsh-scripts/256color.zsh"
source "$HOME/.dotfiles/zsh-scripts/calc.zsh"
source "$HOME/.dotfiles/zsh-scripts/directories.zsh"
source "$HOME/.dotfiles/zsh-scripts/history.zsh"
source "$HOME/.dotfiles/zsh-scripts/render-md.sh"
source "$HOME/.dotfiles/zsh-scripts/keybinds.zsh"

alias :q=exit
alias :qa=exit
alias :wq=exit
alias :wqa=exit
alias vim=nvim
alias siopao=bun
alias siopaox=bunx
alias lg=lazygit

function gp { git pull; }
function gP { git push; }
function gc {
  if [[ $1 = '' ]]; then
    echo 'ERROR: You must supply a commit message' >&2
    return 1
  fi
  git commit -m "$1"
}

fpath=(~/.zsh/zsh-completions $fpath)
autoload -U add-zsh-hook
autoload bashcompinit && bashcompinit

[ -s "/opt/vcpkg/scripts/vcpkg_completion.zsh" ] && source /opt/vcpkg/scripts/vcpkg_completion.zsh
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

[[ -f "$FNM_PATH/node-versions/v24.12.0/installation/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh" ]] && . "$FNM_PATH/node-versions/v24.12.0/installation/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh"

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh --use-on-cd)"
elif command -v fnm &> /dev/null; then
  eval "$(fnm env --shell zsh --use-on-cd)"
fi

source "$HOME/.dotfiles/zsh-scripts/fnm_completions.zsh"

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
