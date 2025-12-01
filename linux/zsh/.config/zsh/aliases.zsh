# configure per-repo commit email
function git_name() {
  if [[ "$#" -ne 1 ]]
  then
    echo "USAGE: $0 <email>"
    return
  fi
  git config user.name "Mike Hoskins"
  git config user.email "$1"
}

# check ssl cert validity
function check_cert() {
  if [[ "$#" -ne 1 ]]
  then
    echo "USAGE: $0 <fqdn>"
    return
  fi
  openssl s_client -connect "${1}:443" -showcerts </dev/null | openssl x509 -outform pem | openssl x509 -noout -dates
}
alias cs="check_cert"

# search doppler secrets
function doppler_search() {
  if [[ "$#" -ne 3 ]]
  then
    echo "USAGE: $0 <project> <environment> <search_term>"
    return
  fi
  _proj="$1"
  _env="$2"
  _val="$3"
  for app in $(doppler -p "${_proj}" --environment "${_env}" configs --json | jq -r '.[].name')
  do
    echo;echo "==> ${_proj}:${app}";echo
    doppler run -p "${_proj}" -c "${app}" -- env | grep "${_val}"
  done
}
alias ds="doppler_search"

# misc
alias cb='xclip -sel clip'
alias charmap='devour gucharmap'
alias dust='du -sh * | sort -hr'
alias fonts='fc-cache -f -v'
alias grep='grep -P -i --color=auto'
alias h='hypr'
alias history='fc -l 1'
alias hugostart='hugo server -DEF --ignoreCache'
alias k='kubectl'
alias lsdrv="lsblk -o NAME,FSTYPE,LABEL,MOUNTPOINT,SIZE,MODEL"
alias luamake='/home/mrh/src/lua-language-server/3rd/luamake/luamake'
alias reader='devour zathura'
alias reboot='killall chromium --wait && reboot'
alias tf='terraform'
alias thumb='devour nsxiv -t .'
alias tg='terragrunt'
alias xclass='xprop | grep WM_CLASS' # display xprop class

alias ls="ls --color"
alias la='ls -alh'
alias ll="ls -al --color"
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'

# paranoia
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# vim
alias vi="cat /dev/null > ${HOME}/.local/state/nvim/lsp.log && nvim"
alias vim="nvim"
alias svim="sudoedit"
# log the keystrokes 
alias nviml='nvim -w ${HOME}/vim.log "$@"'
# launch nvim without any plugin or config (debug)
alias nvimd='nvim --noplugin -u NONE'

# docker
# display names of running containers
alias dkls="docker container ls | awk 'NR > 1 {print \$NF}'"
# delete every containers / images
alias dkrm='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
# prune everything
alias dkclean='docker system prune -a'

# git
alias gwt='_(){ _t=$(wt $1) && cd $_t && echo "==> $_t"; }; _'
alias gwtls="git worktree list"
alias gwtp="git worktree prune"
alias gwtrm="git worktree remove"
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gpraise='git blame'
alias gpo='git push origin'
alias gpof='git push origin --force-with-lease'
alias gpofn='git push origin --force-with-lease --no-verify'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias grb='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff'
alias gco='git checkout '
# alias gl='git log --oneline'
alias gl="git pull && git fetch --prune"
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|main\\|develop' | xargs -n 1 git branch -d"
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"
alias gsub='git submodule update --remote'
alias dif='git diff --no-index'

# golang
alias gob='go build'
alias gor='go run' 
alias goc='go clean -i'
# go test all
alias gta='go test ./...'
# go install all
alias gia='go install ./...'

# pacman
#alias paci='sudo pacman -S'               # install
#alias pachi='sudo pacman -Ql'             # Pacman Has Installed - what files where installed in a package
#alias pacs='sudo pacman -Ss'              # search
#alias pacu='sudo pacman -Syu'             # update
#alias pacr='sudo pacman -R'               # remove package but not dependencies
#alias pacrr='sudo pacman -Rs'             # remove package with unused dependencies by other softwares
#alias pacrc='sudo pacman -Sc'             # remove pacman's cache
#alias pacro='pacman -Rns $(pacman -Qtdq)'
#alias pacrl='rm /var/lib/pacman/db.lck'   # pacman remove locks
#alias pacls="sudo pacman -Qe"
#alias pacc='sudo pacman -Sc'
#alias paccc='sudo pacman -Scc'            # empty the whole cache

# yay
alias yayi='yay -S'     # install
alias yayhi='yay -Ql'   # Yay Has Installed - what files where installed in a package
alias yays='yay -Ss'    # search
alias yayu='yay -Syu'   # update
alias yayr='yay -R'     # remove package but not dependencies
alias yayrr='yay -Rs'   # remove package with unused dependencies by other softwares
alias yayrc='yay -Sc'   # remove yay's cache
alias yayls="yay -Qe"

alias pkgclean='pacman -Rns $(pacman -Qtdq)'
