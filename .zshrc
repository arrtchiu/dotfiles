# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="bureau"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx colored-man colorize cp encode64 sublime heroku postgres redis-cli bundler capistrano gem rails rake rbenv brew)

DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export EDITOR='vim'
set -o vi

export RBENV_ROOT=~/.rbenv
unalias gg
alias gg='git grep -ni'
unalias ggpull
alias ggpull='git pull --rebase origin $(current_branch)'
unalias ggpush
alias ggpush='git push --set-upstream origin $(current_branch)'
unalias gco
alias gco='git checkout'
unalias be
alias be='bundle exec'
unalias rs
alias rs='bundle exec rspec'
bindkey '^R' history-incremental-search-backward
export LANG=en_US.UTF-8
setopt magic_equal_subst

function killjob()
{
    emulate -L zsh
    for jobnum in $@ ; do
        kill ${${jobstates[$jobnum]#*:*:}%=*}
    done
}

function ggc() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  MESSAGE=`echo $(echo $BRANCH | sed -e 's/t\([0-9][0-9][0-9][0-9]\)_.*$/re #\1/') $@`
  git commit -m $MESSAGE
}

