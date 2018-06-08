# [ -z "$TMUX" ] && export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize autojump file-not-find zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration


autoload -U compinit

#following is combined from themes of amuse and robbyrussell
local ret_status="%(?:%{$fg_bold[green]%}OK:%{$fg_bold[red]%}ERR%s)"
PROMPT='
$ret_status %{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
$ '

compinit

setopt extended_glob
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias 1="cd -"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias szshrc="source ~/.zshrc"
alias sbashrc="source ~/.bashrc"
alias zshupdate="upgrade_oh_my_zsh"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ff="find -type f -name"
alias fd="find -type d -name"
alias cls='reset'
alias tl='tmux ls'
alias ta='tmux attach -t'
alias ts='tmux switch-client -t'
alias td='tmux detach'
alias my_work='tmux attach-session -t "chenyu" || tmux -f ~/workspace.tmux.conf attach'
alias gvim='vim'
alias sai='sudo apt-get install'
alias sarm='sudo apt-get remove'
alias saupt='sudo apt-get update'
alias saupg='sudo apt-get upgrade'
alias saarm='sudo apt-get autoremove'
alias saacln='sudo apt-get autoclean'
alias ack='ack-grep'
alias ll='ls -lhtF'
alias lla='ls -lhtAF'
alias synctime='sudo service ntp stop;sudo ntpdate 0.cn.pool.ntp.org;sudo service ntp start'
alias sudo='sudo '

#use ctrl-z to switch between shell and bkgrd job
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0  ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

ulimit -c unlimited
export LC_ALL=en_US.UTF-8
