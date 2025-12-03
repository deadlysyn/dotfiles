#!/usr/bin/env zsh

umask 022

unsetopt BEEP               # Be quiet
unsetopt EXTENDEDGLOB       # Ignore #/~/^ in expansion
unsetopt NOTIFY             # Be quieter about bg jobs
setopt CORRECT              # Correct misspelled commands
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
setopt NOMATCH              # Error on bad filename patterns
setopt AUTO_CD              # Don't need cd to change dirs
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# history
# use this...
setopt SHARE_HISTORY
# or one of these... not both.
unsetopt APPEND_HISTORY
unsetopt INC_APPEND_HISTORY
unsetopt INC_APPEND_HISTORY_TIME

setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# colors and prompt
autoload -U colors && colors
# enable substitution for prompt
setopt prompt_subst

# completion
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion
zstyle ':completion:*' rehash true                        # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${ZDOTDIR}/.zcompcache"
zmodload zsh/complist
compinit
_comp_options+=(globdots) # tab complete dot files

# Emulation of vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# vi mode
bindkey -v
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# edit line in vim with ctrl-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}
bindkey -s '^o' 'lfcd\n'
bindkey -s '^a' 'bc -l\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
else
  PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

if [ $(command -v "fzf") ]; then
  if [ -f "${HOME}/.fzf.zsh" ]; then
    source ~/.fzf.zsh
  else
    echo "ERROR: failed sourcing fzf.zsh"
  fi
fi

# https://github.com/rupa/z
[ -r /usr/share/z/z.sh ] && source /usr/share/z/z.sh

# setup direnv
eval "$(direnv hook zsh)"

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
if [ -e '/usr/share/nvm' ]; then
  source /usr/share/nvm/nvm.sh
fi

# disable ctrl-s freezing terminal
stty stop undef

if [ -f "${XDG_CONFIG_HOME}/zsh/aliases.zsh" ]; then
  source "${XDG_CONFIG_HOME}/zsh/aliases.zsh"
else
  echo "ERROR: failed sourcing aliases"
fi

# keep these last
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777777'
