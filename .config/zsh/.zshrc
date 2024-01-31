
export PATH="/opt/homebrew/bin:${HOME}/.local/bin:${HOME}/go/bin:${HOME}/Documents/Dev/Git/opsbox/bin:${PATH}"

# Setup gnu flavored utilities
# https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da
BREW_BIN="/usr/local/bin/brew"
if [ -f "/opt/homebrew/bin/brew" ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
fi

if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  NEWPATH=${PATH}
  # gnubin; gnuman
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do NEWPATH=$d:$NEWPATH; done
  # I actually like that man grep gives the BSD grep man page
  #for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
  export PATH=$(echo ${NEWPATH} | tr ':' '\n' | cat -n | sort -uk2 | sort -n | cut -f2- | xargs | tr ' ' ':')
fi

# Aliases
alias grep="grep --color"
alias dev="cd ${HOME}/Documents/Dev"
alias cdgit="cd ${HOME}/Documents/Dev/Git"
alias cddev="cd ${HOME}/Documents/Dev"
alias vi="nvim"
alias updatedb='gupdatedb --localpaths="/" --prunepaths="/Volumes /System" --output=$HOME/locatedb 2>&1|ggrep -E -v "Operation not permitted|Permission denied"'
if which glocate > /dev/null; then
  [[ -f "${HOME}/locatedb" ]] && export LOCATE_PATH="${HOME}/locatedb"
fi
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"


# Setting up FZF default commands
export FD_OPTIONS="-E .git -E node_modules --follow"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --no-mouse --multi'
export FZF_DEFAULT_COMMAND='git ls-files --cached --others --exclude-standard |fd --type f --type l --hidden $FD_OPTIONS'
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
alias fzf="fzf --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'"
alias fzfpre="fzf --preview 'head -100 {}'"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--sort --exact"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bind opt with arrow keys to move cursor one word at a time
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Bare Git repo for dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=${HOME}/Documents/Dev/Git/dotfiles --work-tree=${HOME}'

export TMUX_CONFIG=${HOME}/.config/tmux
export STARSHIP_CONFIG=${HOME}/.config/starship/starship.toml
export STARSHIP_CACHE=${HOME}/.config/starship/cache
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"
