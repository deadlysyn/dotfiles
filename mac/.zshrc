export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin"
# make 'code' available in PATH
export PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
# use NODE LTS (brew install node@10)
export PATH="/usr/local/opt/node@10/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node@10/lib"
export CPPFLAGS="-I/usr/local/opt/node@10/include"

# golang stuff
export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# work stuff
export VAULT_ADDR="https://vault.pez.pivotal.io:8200"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="simple"
#ZSH_THEME="minimal"
#ZSH_THEME="sorin"
#ZSH_THEME="refined"
ZSH_THEME="" # use pure prompt configured below...

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE=""

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE=""

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE=""

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS=""

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE=""

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION=""

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS=""

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY=""

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  #common-aliases
  #fzf
  git
  golang
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi=nvim
alias vim=nvim
alias tc="tmux show-buffer | pbcopy"
alias c="code -n ."

# https://github.com/kejadlen/git-together
alias git=git-together
# https://github.com/pivotal/git-author
export GIT_TOGETHER_NO_SIGNOFF=1

setopt appendhistory autocd nomatch
unsetopt beep extendedglob notify
bindkey -v

fpath=(/usr/local/share/zsh-completions $fpath)

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/mhoskins/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set pure prompt
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
PURE_CMD_MAX_EXEC_TIME=10
PURE_GIT_UNTRACKED_DIRTY=0
# prompt sections you can color:
# path
# |          git:branch
# |          |       git:arrow
# |          |       |        host
# |          |       |        |
# ~/dev/pure master* ⇡ zaphod@heartofgold  42s
# venv ❯               |                   |
# |    |               |                   execution_time
# |    |               user
# |    prompt
# virtualenv
# change the path color
#zstyle :prompt:pure:path color white
# change the color for both `prompt:success` and `prompt:error`
#zstyle ':prompt:pure:prompt:*' color cyan
prompt pure

# Automatically quote URLs when pasted
#autoload -U url-quote-magic
#zle -N self-insert url-quote-magic

export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export KEYTIMEOUT=1 # kill vi mode lag
export EDITOR=nvim
export FCEDIT=nvim
export VISUAL=nvim
export LESS=-RXe
export PAGER=less
export DISPLAY="127.0.0.1:0.0"
export OS=`uname`
export PRUNEFS="nfs ctfs devfs fd lofs mntfs objfs proc tmpfs udfs"

#export ZSH_TMUX_AUTOSTART=
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100

# Functions which modify the path given a directory, but only if the directory
# exists and is not already in the path. (Super useful in ~/.zshlocal)
_prepend_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}
_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}
_force_prepend_to_path() {
  path=($1 ${(@)path:#$1})
}

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() {
  return $( eval $* >/dev/null 2>&1 )
}

# https://github.com/rupa/z
. /usr/local/etc/profile.d/z.sh

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
  export FZF_BASE="$HOME/.fzf/bin"
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
 # export FZF_DEFAULT_OPTS='
 # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
 # --color info:108,prompt:109,spinner:108,pointer:168,marker:168
 # '
fi

if [ -e /usr/local/Caskroom/google-cloud-sdk ]; then
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi

eval "$(direnv hook zsh)"
