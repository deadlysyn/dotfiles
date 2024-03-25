unsetopt BEEP               # Be quiet
unsetopt EXTENDEDGLOB       # Ignore #/~/^ in expansion
unsetopt NOTIFY             # Be quieter about bg jobs
unsetopt CORRECT            # Don't correct misspelled commands
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
setopt NOMATCH              # Error on bad filename patterns
setopt AUTO_CD              # Don't need cd to change dirs
stty stop undef             # Disable ctrl-s freezing terminal

# history
export HISTFILE="${XDG_CONFIG_HOME}/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

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

# color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

PATH="${HOME}/.bin:${HOME}/bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin"
export PATH

export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export GOROOT="/usr/lib/go"
export PATH="${GOBIN}:${GOROOT}/bin:${PATH}"
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
# kill vi mode lag - don't need set to 1 anymore (default 20)
export KEYTIMEOUT=5

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

# Base16 Shell
#BASE16_SHELL="${HOME}/.config/base16-shell/"
#[ -n "${PS1}" ] && \
#  [ -s "${BASE16_SHELL}/profile_helper.sh" ] && \
#  eval "$("${BASE16_SHELL}/profile_helper.sh")"

# setup direnv
eval "$(direnv hook zsh)"

# fzf + ag configuration
_has() {
  return $( whence $1 >/dev/null )
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
  export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND}"
 # export FZF_DEFAULT_OPTS='
 # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
 # --color info:108,prompt:109,spinner:108,pointer:168,marker:168
 # '
fi

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/bin/terraform terraform

# keep these last
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777777'

if [[ -f ~/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
    source ~/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
elif [[ -f/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# look pretty
function set_win_title(){
  echo -ne "\033]0; ${USER}@${HOST}:${PWD} \007"
}
precmd_functions+=(set_win_title)
#starship_precmd_user_func="set_win_title"
#test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
#neofetch
if command -v starship >/dev/null; then
    eval "$(starship init zsh)"
else
    PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

alias ls="ls --color"
alias ll="ls -al --color"
alias vi="lvim"
alias vim="lvim"
#alias tc="tmux show-buffer | pbcopy"
alias c="codium -n ."
alias p="bluetoothctl power on; bluetoothctl connect CA:CD:EC:C0:B8:9D"
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '
#alias av="aws-vault exec --ecs-server"
#alias al="aws-vault login"
alias charmap="devour gucharmap"
alias pdf="devour zathura"
alias reader="devour zathura"
alias pulse="devour pavucontrol"
alias mixer="pulsemixer"
alias view="devour sxiv"
alias thumb="devour sxiv -t ."
alias mpv="devour mpv"
alias player="devour mpv"
