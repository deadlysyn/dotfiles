unsetopt BEEP               # Be quiet
unsetopt EXTENDEDGLOB       # Ignore #/~/^ in expansion
unsetopt NOTIFY             # Be quieter about bg jobs
unsetopt CORRECT            # Don't correct misspelled commands
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
setopt NOMATCH              # Error on bad filename patterns
setopt AUTO_CD              # Don't need cd to change dirs
stty stop undef             # Disable ctrl-s freezing terminal

# history
export HISTFILE="${HOME}/.config/zsh/history"
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

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export PATH="${HOME}/.local/bin:${HOME}/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin"

export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

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
#export KEYTIMEOUT=5

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

# setup direnv
eval "$(direnv hook zsh)"

# fzf + rg configuration
#export FZF_DEFAULT_COMMAND='rg --nocolor -g ""'
#export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
#export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND}"
# export FZF_DEFAULT_OPTS='
# --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
# --color info:108,prompt:109,spinner:108,pointer:168,marker:168
# '
#[[ -f "${HOME}/.config/zsh/.fzf.zsh" ]] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# keep these last
SUGGEST="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "${SUGGEST}" ]] && source "${SUGGEST}"
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# look pretty
function set_win_title(){
  echo -ne "\033]0; ${USER}@${HOST}:${PWD} \007"
}
precmd_functions+=(set_win_title)
#starship_precmd_user_func="set_win_title"
if command -v starship >/dev/null; then
    eval "$(starship init zsh)"
else
    PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

alias k="kubectl --request-timeout=1h"
alias rc="source ${HOME}/.config/zsh/.zshrc"
alias vrc="vi ${HOME}/.config/zsh/.zshrc"
alias ls="ls --color"
alias ll="ls -al --color"
alias tf="terraform"
alias tfa="terraform apply"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias vi="lvim"
alias vim="lvim"
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

# https://github.com/rupa/z
[[ -e "${HOME}/bin/z.sh" ]] && . "${HOME}/bin/z.sh"

# local functions we don't want in git
[[ -e "${HOME}/.zsh_functions" ]] && . "${HOME}/.zsh_functions"
