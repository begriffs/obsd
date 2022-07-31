set -o noclobber
set -o nounset
set -o vi

LC_CTYPE=en_US.UTF-8
export LC_CTYPE

export CC=clang
export EDITOR=/usr/local/bin/vim
export PATH=$HOME/bin:$PATH
export PS1="\W$ "
export SSH_AUTH_SOCK=~/.ssh/ssh-socket

alias g="git"
alias pman="man -M $HOME/posix-man/issue7"
alias pman6="man -M $HOME/posix-man/issue6"

alias bt="egdb --batch -ex 'set print addr off' -ex 'set print pretty on' -ex 'set print frame-arguments all' -ex 'thread apply all bt full'"
alias armddd="ddd --gdb --debugger \"arm-none-eabi-gdb -x ~/.gdb/arch/cm3.init\""

alias rddd="ddd --debugger gdb --no-exec-window --host"

alias wifi="doas /sbin/ifconfig iwn0"

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
  # No ssh-agent running
  rm -rf $SSH_AUTH_SOCK
  eval `ssh-agent -a $SSH_AUTH_SOCK`
  echo $SSH_AGENT_PID >| ~/.ssh/ssh-agent-pid
fi
