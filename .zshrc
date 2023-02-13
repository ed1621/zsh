# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -U PATH

alias luamake=/Users/ed/.config/nvim/lua-language-server/3rd/luamake/luamake
## set env variables


if [[ "$(hostname 2> /dev/null)" == *"EduMart"* ]]; then
  . $ZDOTDIR/.zsh_zscaler
fi

export XDG_CONFIG_HOME="$HOME/.config"
export CONFIG="$XDG_CONFIG_HOME"
export EDITOR="nvim"

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE="$ZDOTDIR/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CELLAR="/usr/local/Cellar"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
export NVIM_HOME="$CONFIG/nvim"
export USR_OPT="/usr/local/opt"
export CPPFLAGS="-I$USR_OPT/openjdk@11/include"
export HADOOP_HOME="$CELLAR/hadoop/3.3.2/libexec"
export YARN_CONF_DIR="$HADOOP_HOME/etc/hadoop"

#before PATH
cargo="$HOME/.cargo/bin"
avrdude="$USR_OPT/avrdude/bin"
avrgcc="$USR_OPT/avr-gcc@8/bin"
openjdk="$USR_OPT/openjdk@11/bin"
python="$USR_OPT/python@3.9/libexec/bin"
home_bin="$HOME/.local/bin"
opt_bin="/opt/local/bin"
usr_bin="/usr/local/bin"
java="$JAVA_HOME/bin"
ruby="/usr/local/opt/ruby/bin"
poetry="$HOME/Library/Python/3.9/bin"
before_path="$cargo:$avrdude:$avrgcc:$openjdk:$python:$home_bin:$opt_bin:$usr_bin:$ruby:$poetry"

#after PATH
coursier="$HOME/Library/Application Support/Coursier/bin"
home_share="$HOME/.local/share"
lsp_install="$HOME/.local/share/nvim/lspinstall"
elixir="$HOME/usr/local/opt/elixir"
after_path="$coursier:$home_share:$lsp_install:$elixir:$java"

export PATH="$before_path:$PATH:$after_path"

if [[ $(command -v sheldon) ]]; then
  eval "$(sheldon source)"
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

