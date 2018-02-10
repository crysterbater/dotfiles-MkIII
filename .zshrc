# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export FPATH=~/.my_zsh_functions:$FPATH
# export FPATH=$HOME/.config/zsh/*.zsh
eval $( dircolors -b $HOME/LS_COLORS )

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle nvm
antigen bundle wd
antigen bundle tomsquest/nvm-auto-use.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme agnoster
antigen apply

# Path to your oh-my-zsh installation.
  export ZSH=/home/dead/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias 0=neofetch
alias 1=nerdinfo.sh
alias q=reload
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tmp="cd /home/dead/.tmp"
alias grep='grep --color'
alias kp='killall polybar'
alias xm="xrdb -merge ~/.Xresources"
alias xr="xrdb ~/.Xresources"
alias reload="exec $SHELL -l"
alias got='gorice tracked i3'
alias goadd='gorice track i3'
alias .="cd /home/dead"
alias play="ncmpcpp -S visualizer"
alias sdl="scdl -l "
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ll='ls -a'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -l'
alias tag='/home/dead/bin/mp3tagger '
alias ipinfo=iwconfig

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gist='/home/dead/bin/gist.sh -u crysterbater '
# -------------------------------------------------------------------
# YADM
# -------------------------------------------------------------------
alias ya='yadm add'
alias push="yadm push -u origin master"
alias yl='yadm log'
alias ys='yadm status'
alias yd='yadm diff'
alias ym='yadm commit -m'
alias yma='yadm commit -am'
alias yb='yadm branch'
alias yc='yadm checkout'
alias yra='yadm remote add'
alias yrr='yadm remote rm'
alias ypu='yadm pull'
alias ycl='yadm clone'
alias yta='yadm tag -a -m'
alias yf='yadm reflog'

# -------------------------------------------------------------------
# AUR
# -------------------------------------------------------------------
alias aur-install="pacaur -Sa"
alias aur-clean="pacaur -Sca"
alias aur-update="pacaur -Syua"
alias aur-remove="pacaur -Rsa"
alias aur-search="pacaur -Qsqa"
alias aur-Search="pacaur -Ssqa"
alias aur-info="pacaur -Sia"
alias aur-desc="alias-aur-desc"
alias aur-size="alias-aur-size"
alias aur-dep="alias-aur-dep"

# -------------------------------------------------------------------
# PACMAN
# -------------------------------------------------------------------
alias pac-install="alias-pac-install"
alias pac-update="alias-pac-update"
alias pac-remove="sudo pacman -Rs"
alias pac-search="pacman -Qsq"
alias pac-Search="pacman -Ssq"
alias pac-list="alias-pac-list"
alias pac-orphan="sudo pacman -Rns $(pacman -Qtdq)"                                   # Remove unused packages (orphans)
alias pac-info="pacman -Si"
alias pac-desc="expac -S '%d'"
alias pac-size="expac -S -HM '%k\t%n'"                                                # Show download size of package(s)
alias pac-Size="expac -S -HM '%k\t%n' | sort -n | tail -n20"                          # Show nth largest download size of package(s)
alias pac-latest="expac -HM --timefmt='%Y-%m-%d %T' '%l\t%-20n\t%m' | sort | tail -n20" # List nth last installed packages
alias pac-Latest="alias-pac-latest-e"                                                 # List nth last explicitly installed packages which is not in base/base-devel group
alias pac-dep="alias-pac-dep"

# -------------------------------------------------------------------
# EDIT CONFIGS
# -------------------------------------------------------------------
alias compton-conf="$EDITOR $HOME/.config/compton.conf"
alias dunst-conf="$EDITOR $HOME/.config/dunst/dunstrc"
alias i3-conf="$EDITOR $HOME/.config/i3/config"
alias git-conf="$EDITOR $HOME/.config/git/config"
alias neofetch-conf="$EDITOR $HOME/.config/neofetch/config"
alias polybar-conf="$EDITOR $HOME/.config/polybar/config"
alias dunst-conf="$EDITOR $HOME/.config/dunst/dunstrc"
alias mp-conf="$EDITOR $HOME/.config/ncmpcpp/config"

# -------------------------------------------------------------------
# XPROP
# -------------------------------------------------------------------
alias xprop-class="xprop WM_CLASS"
alias xprop-role="xprop WM_WINDOW_ROLE"
alias xprop-title="xprop _NET_WM_NAME WM_NAME"




run_ls() {
	ls --color=auto -w $(tput cols) "$@"
}

run_dir() {
	dir-i --color=auto -w $(tput cols) "$@"
}

run_vdir() {
	vdir-i --color=auto -w $(tput cols) "$@"
}
alias ls="run_ls"
alias dir="run_dir"
alias vdir="run_vdir"


eval $(dircolors -b $HOME/.dircolors)
