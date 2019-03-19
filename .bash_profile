# .bashrc

# http://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion
if [ -f ~/dotfiles/.git-completion.bash ]; then
  . ~/dotfiles/.git-completion.bash
fi

# mac bash completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# alias la="ls -aGgh --color"
alias la="ls -aGgh"
alias twig="git branch -vv --sort=-authordate"
alias weather="curl -s wttr.in/Vancouver"
alias fe-global="docker exec -it fe-global"
alias tapas="docker exec -it fe-global ./tapas"

export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NODEJS_CHECK_SIGNATURES='no' # asdf pgp check node values: strict, no, yes

__git_branch () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf "%s " "${b##refs/heads/}";
  fi
}

__prompt () {
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf "*> "
  else
    printf "+> "
  fi
}

trap 'echo -ne "\033[0m"' DEBUG

BOLD="\[\e[1m\]"
DIM="\[\e[2m\]"
BLINK="\[\e[5m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RESET="\[\e[0m\]"

PS_TIME="${DIM}[${RESET}${BOLD}\A${RESET}${DIM}] ${RESET}"
PS_PWD="${BOLD}${BLUE}\W/ ${RESET}"
PS_BRANCH="${BOLD}${RED}\$(__git_branch)${RESET}"
PS_PROMPT="${BOLD}${GREEN}\$(__prompt)${RESET}"
PS1="${PS_TIME}${PS_BRANCH}${PS_PWD}${PS_PROMPT}"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$PATH:$HOME/selenium_drivers"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
