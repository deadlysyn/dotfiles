# .zshenv is always sourced, even for one-shot commands (-c)

umask 022

export ZDOTDIR="${HOME}/.config/zsh"

export LESS="-RXe"
export PAGER="less"
#export PRUNEFS="nfs ctfs devfs fd lofs mntfs objfs proc tmpfs udfs"
export EDITOR="/bin/nvim"
export FCEDIT="/bin/nvim"
export VISUAL="/bin/nvim"
#export SUDO_ASKPASS="/usr/X11R6/bin/ssh-askpass"
export SSH_KEY_PATH="${HOME}/.ssh/id_rsa"

