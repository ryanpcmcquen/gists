# So I know where I am in repos:
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colorize `ls` by default:
alias ls='ls -G'

[ -e ~/.bash_SECRETS ] && . ~/.bash_SECRETS

# Modified from:
# https://stackoverflow.com/a/4138531/2662028
export PS1='\n\[\e[1;37m\]|-- \[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(parse_git_branch " (%s)")\[\e[0;39m\] \[\e[1;37m\]--|\[\e[0;39m\]\n\$ '

# Old prompt (less fun):
#export PS1='\u@\w:$(parse_git_branch)\$ '

# Without this, Mac OS will not share your terminal
# history across sessions ...
export SHELL_SESSION_HISTORY=0

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="$PATH:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/local/opt/node@12/bin"
