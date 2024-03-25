# .zshenv is always sourced, even for one-shot commands (-c)

umask 022

export ZDOTDIR="${HOME}/.config/zsh"

export LESS="-RXe"
export PAGER="less"
#export PRUNEFS="nfs ctfs devfs fd lofs mntfs objfs proc tmpfs udfs"
export EDITOR="lvim"
export FCEDIT="lvim"
export VISUAL="lvim"
export SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"
export TERM="xterm-256color"
