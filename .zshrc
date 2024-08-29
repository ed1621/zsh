eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


alias luamake=/Users/ed/.config/nvim/lua-language-server/3rd/luamake/luamake
## set env variables

export XDG_CONFIG_HOME="$HOME/.config"
export CONFIG="$XDG_CONFIG_HOME"
export ZK_NOTEBOOK_DIR="$HOME/code/personal/zk"
export EDITOR="nvim"

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE="$ZDOTDIR/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
export SPARK_HOME="$HOME/code/spark"
export NVIM_HOME="$CONFIG/nvim"
export USR_OPT="/usr/local/opt"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$USR_OPT/avrdude/bin:$PATH"
export PATH="$USR_OPT/avr-gcc@8/bin$PATH"
export PATH="$USR_OPT/openjdk@11/bin:$PATH"
export PATH="$USR_OPT/python@3.10/libexec/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
export PATH="$PATH:$HOME/.local/share"
export PATH="$PATH:$HOME/.local/share/nvim/lspinstall"
export PATH="$PATH:$HOME/usr/local/opt/elixir"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export CPPFLAGS="-I$USR_OPT/openjdk@11/include"

eval "$(sheldon source)"


if [[ $(command -v nnn) ]]; then
  . $ZDOTDIR/.nnn_env
fi

[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

# for haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

autoload -U +X bashcompinit && bashcompinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

## Load aliases and functions
if [ -f $ZDOTDIR/aliases/general ]; then
    . $ZDOTDIR/aliases/general
fi

if [ -f $ZDOTDIR/functions/general ]; then
    . $ZDOTDIR/functions/general
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

