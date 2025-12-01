unsetopt BEEP               # Be quiet
unsetopt EXTENDEDGLOB       # Ignore #/~/^ in expansion
unsetopt NOTIFY             # Be quieter about bg jobs
unsetopt CORRECT            # Don't correct misspelled commands
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
setopt NOMATCH              # Error on bad filename patterns
setopt AUTO_CD              # Don't need cd to change dirs
stty stop undef             # Disable ctrl-s freezing terminal

# history
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

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

umask 022

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

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

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion
zstyle ':completion:*' rehash true                        # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zmodload zsh/complist
compinit
_comp_options+=(globdots) # tab complete dot files

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

# Automatically quote URLs when pasted
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# setup direnv
eval "$(direnv hook zsh)"


[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/bin/terraform terraform

# keep these last
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777777'

# if [[ -f ~/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
#     source ~/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# elif [[ -f/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
#     source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi

[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"
if [[ -e '/usr/share/nvm' ]]; then
  source /usr/share/nvm/nvm.sh
  # source /usr/share/nvm/install-nvm-exec
fi

# https://github.com/rupa/z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
else
  PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

source "${XDG_CONFIG_HOME}/zsh/aliases"

