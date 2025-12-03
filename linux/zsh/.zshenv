#!/usr/bin/env zsh

# https://specifications.freedesktop.org/basedir/latest
export XDG_CONFIG_HOME="${HOME}/.config"
# export XDG_DATA_HOME="${XDG_CONFIG_HOME}/local/share"
# export XDG_CACHE_HOME="${XDG_CONFIG_HOME}/cache"

PATH="${HOME}/.bin:${HOME}/bin:${HOME}/.local/bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin"
export PATH
# Created by `pipx` on 2024-10-30 14:32:21
export PATH="$PATH:/home/mrh/.local/bin"
# golang
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export GOROOT="/usr/lib/go"
export PATH="${GOBIN}:${GOROOT}/bin:${PATH}"

# editor
export EDITOR="nvim"
export FCEDIT="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${ZDOTDIR}/history"
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=10000
export SAVEHIST=10000

# misc
export LESS="-RXe"
export MANPAGER="nvim +Man!"
export PAGER="less"
export PRUNEFS="nfs ctfs devfs fd lofs mntfs objfs proc tmpfs udfs"
# color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
# faster vim mode
# used to fix a bug, no longer needs set to 1
# default: 20
export KEYTIMEOUT=5

# https://terragrunt.gruntwork.io/docs/features/provider-cache-server
export TG_PROVIDER_CACHE=1
export TG_PROVIDER_CACHE_DIR="/backup/tgcache"
export TG_PROVIDER_CACHE_REGISTRY_NAMES="registry.terraform.io,registry.opentofu.org,gitlab.com,github.com"
export TG_NO_AUTO_APPROVE=true

# fzf
#export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND}"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"
