# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

DUMBTERM=false
case $TERM in
    "dumb"|"eterm-color")
        DUMBTERM=true;;
    *)
        export TERM="xterm-256color"
esac


# Path to my oh-my-zsh installation.
#
# Lets try to find it in "dotfiles", ".dotfiles" or default oh my zsh path

if [ -f "$HOME/dotfiles/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/dotfiles/.oh-my-zsh"
elif [ -f "$HOME/.dotfiles/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/dotfiles/.oh-my-zsh"
elif [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
else
    echo "Could not find .oh-my-zsh installment, install it by running the following command:"
    echo 'sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'
    echo "Or install it by git clone --recursive git@github.com:Eeemil/dotfiles.git"
fi
    
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Default fallbak theme
ZSH_THEME="robbyrussell"
# Try to load powerlevel9k theme. If it isn't installed in
# .oh-my-zsh/custom/themes, try to find it in dotfiles and symlink it
if [ "$DUMBTERM" = "true" ]; then
    ZSH_THEME="robbyrussell"
elif [ -f "$ZSH/custom/themes/powerlevel9k/powerlevel9k.zsh-theme" ]; then
    ZSH_THEME="powerlevel9k/powerlevel9k"
elif [ -f "$HOME/dotfiles/powerlevel9k/powerlevel9k.zsh-theme" ]; then
    ln -s "$HOME/dotfiles/powerlevel9k" "$ZSH/custom/themes/powerlevel9k"
    ZSH_THEME="powerlevel9k/powerlevel9k"
fi

if [ "$ZSH_THEME"="powerlevel9k/powerlevel9k" ]; then
    POWERLEVEL9K_MODE='nerdfont-complete'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false

    POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
    POWERLEVEL9K_ALWAYS_SHOW_USER=true

    POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
    POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="blue3"

    POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="yellow3"
    POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=true


    POWERLEVEL9K_DATE_FORMAT="%D{%m-%d}"

    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
    POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
    POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
    POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"

    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

    POWERLEVEL9K_STATUS_VERBOSE=true
    POWERLEVEL9K_STATUS_CROSS=true
    POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460 "

    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs status ssh aws kubecontext date time_joined)

    POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="magenta"
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_DIR_HOME_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_HOME_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_STATUS_OK_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
    POWERLEVEL9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_STATUS_OK_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"

    POWERLEVEL9K_STATUS_ERROR_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
    POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"

    POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_EXECUTION_TIME_ICON="\u23F1"

    POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_FOREGROUND"

    POWERLEVEL9K_USER_ICON="\uF415" # 
    POWERLEVEL9K_USER_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_USER_ROOT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="magenta"
    POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"
    POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$(( $DEFAULT_BACKGROUND - 2 ))"
    #POWERLEVEL9K_ROOT_ICON=$'\uFF03' # ＃
    POWERLEVEL9K_ROOT_ICON=$'\uF198'  # 

    POWERLEVEL9K_SSH_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_SSH_FOREGROUND="yellow"
    POWERLEVEL9K_SSH_BACKGROUND="red"
    POWERLEVEL9K_SSH_ICON="\uF489"  # 

    POWERLEVEL9K_HOST_LOCAL_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_HOST_REMOTE_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_OS_ICON_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_WARNING_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
    POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
    POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="green"
    POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
    POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
    POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

    POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND_COLOR="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="$DEFAULT_BACKGROUND"
fi


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize)

# Add kubernetes plugins if kubernetes is installed...
if (( $+commands[kubectl] )); then
    plugins+=(kubectl minikube kops helm)
fi
if (( $+commands[aws] )); then
    plugins+=(aws)
fi
if (( $+commands[docker-compose] )); then
    plugins+=(docker-compose)
fi
if (( $+commands[docker] )); then
    plugins+=(docker)
fi

if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

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

# Emacs logic for C-x C-f:ing CWD-aware within ansi-term
precmd() {
    if [ -z "$EMACS" ]; then
	return
    fi
    echo -e "\033AnSiTu" "$LOGNAME" # $LOGNAME is more portable than using whoami.
    echo -e "\033AnSiTc" "$(pwd)"
    if [ $(uname) = "SunOS" ]; then
 # The -f option does something else on SunOS and is not needed anyway.
   	    hostname_options="";
    else
        hostname_options="-f";
    fi
    echo -e "\033AnSiTh" "$(hostname $hostname_options)" # Using the -f option can
                                                         # cause problems on some OSes.
}


function beep {
    msg=""
    if [ $# -gt 0 ]; then
	# Has supplied arguments
	msg="Message: $@"
    fi
    SESSION_TYPE="local"
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	SESSION_TYPE="remote/ssh"
	# many other tests omitted
    else
	case $(ps -o comm= -p $PPID) in
	    sshd|*/sshd) SESSION_TYPE="remote/ssh";;
	esac
    fi

    if [ $SESSION_TYPE = "local" ]; then
	# On local machine we can send out sounds
	if [ -x "$(command -v paplay)" ]; then
	    setsid paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null
	    # Paplay and /usr/share/sounds/freedesktop/stereo/complete.oga should exist
	    # on most environments...
	fi
	# Make a desktop notification
	if [ -x "$(command -v notify-send)" ]; then
	    notify-send "🐱🐱🐱BEEP🐱🐱🐱" "From: $PWD\r\n$msg"
	fi
    fi
    echo "🐱🐱🐱"
    echo "HHHHH   HHHHH  HHHHH  HHHH"
    echo "H    H  H      H      H   H"
    echo "H    H  H      H      H   H"
    echo "HHHHH   HHH    HHH    HHHH"
    echo "H    H  H      H      H"
    echo "H    H  H      H      H"
    echo "HHHHH   HHHHH  HHHHH  H"
    echo "$msg"
}

function waitfor {
    local ret
    echo "Will run command '$@' until it returns 0"
    until "$@" &>/dev/null; do
        sleep 1
    done
    beep "Command finished: '$@'"
}

function .env {
    if [ ! -f ".env" ]; then
        echo "Error: no .env file found"
        return -1
    fi
    echo "########## Loading .env..."
    if [ ! -x "$(which pygmentize)" ]; then
        cat .env
    else
        pygmentize -l bash .env
    fi
    source .env
    echo "########## .env loaded"
}

_dotenv_exists() {
    if [[ -f .env ]]; then
        echo "Local .env file exists. Load it with command \".env\""
    fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd _dotenv_exists


# kubectl switch ns easily
alias kns='kubectl config set-context $(kubectl config current-context) --namespace '

# Override default git command
# Using "git pull" is not very good. Lets get rid of that habit
function git {
    if [[ $@ == "pull" ]]; then
        echo "You should stop this habit. Read why here: https://adamcod.es/2014/12/10/git-pull-correct-workflow.html"
        command git pull --rebase=preserve
        echo "You should stop this habit. Read why here: https://adamcod.es/2014/12/10/git-pull-correct-workflow.html"
    else
        command git $@
    fi
}

if (( $+commands[pygmentize] )); then
    export LESSOPEN='|pygmentize %s'
fi

# send a HTTP 1.0 get request with nc
# $1 = host
# $2 = resource
function nc_get {
    local resource=${2:-"/"}
    nc "$1" 80 <<EOF
GET $resource HTTP/1.0
Host: $1

EOF
}

# wanip command: use fastest tool to get external IP as discussed in
# https://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-a-shell-script
if (( $+commands[dig] )); then
    alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
elif (( $+commands[GET] )); then
    alias wanip='GET http://whatismyip.akamai.com'
elif (( $+commands[curl] )); then
    alias wanip='curl -s http://whatismyip.akamai.com/'
elif (( $+commands[wget] )); then
    alias wanip='wget http://whatismyip.akamai.com/ -q -O -'
elif (( $+commands[wget] )); then
    alias wanip='nc_get whatismyip.akamai.com / | tail -1'
else
    alias wanip='echo "Go to http://whatismyip.akamai.com and fetch your ip yourself (and/or install dig/dnsutils)"'
fi
export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""

alias e=emacsclient
alias g=git
export PATH="${HOME}/.local/bin:${PATH}"
# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH  

export GOPATH=$HOME/.go/workspace
export PATH=$PATH:$GOPATH/bin

