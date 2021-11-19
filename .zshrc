# Emil Marklund's ZSH configuration.
# Established around September 2015
#
# Notes:
# ascii art generated by:
# toilet -f future <text>

# Emacs may need special treatment
DUMBTERM=false
case $TERM in
    "dumb"|"eterm-color")
        DUMBTERM=true;;
    "tramp")
          unsetopt zle
          unsetopt prompt_cr
          unsetopt prompt_subst
          if whence -w precmd >/dev/null; then
              unfunction precmd
          fi
          if whence -w preexec >/dev/null; then
              unfunction preexec
          fi
          PS1='$ '
          return
    ;;
    *)
        export TERM="xterm-256color"
esac

# ┏━┓┏━┓┏━╸╻  ┏━┓┏━┓╺┳┓╻┏┓╻┏━╸
# ┣━┛┣┳┛┣╸ ┃  ┃ ┃┣━┫ ┃┃┃┃┗┫┃╺┓
# ╹  ╹┗╸┗━╸┗━╸┗━┛╹ ╹╺┻┛╹╹ ╹┗━┛
# preloading
# Stuff needed to be loaded before anything else
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/eeemil/src/google-cloud-sdk/path.zsh.inc' ]; then . '/home/eeemil/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/eeemil/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/eeemil/src/google-cloud-sdk/completion.zsh.inc'; fi

# ┏━┓╻ ╻   ┏┳┓╻ ╻   ╺━┓┏━┓╻ ╻   ╻  ┏━┓┏━╸┏━┓╺┳╸╻┏━┓┏┓╻
# ┃ ┃┣━┫╺━╸┃┃┃┗┳┛╺━╸┏━┛┗━┓┣━┫   ┃  ┃ ┃┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛╹ ╹   ╹ ╹ ╹    ┗━╸┗━┛╹ ╹   ┗━╸┗━┛┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹
# oh-my-zsh location
# Path to my oh-my-zsh installation.
#
#Default fallback path
DOTFILES=$HOME
if [ -d "$HOME/dotfiles" ]; then
    DOTFILES="$HOME/dotfiles"
elif [ -d "$HOME/.dotfiles" ]; then
    DOTFILES="$HOME/.dotfiles"
else
    echo "Warning: dotfiles not found, install it with 'git clone git@github.com:Eeemil/dotfiles.git ~/dotfiles'"
fi

if [ -f "$DOTFILES/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/dotfiles/.oh-my-zsh"
elif [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
else
    echo "Could not find .oh-my-zsh installment, install it by running the following command:"
    echo 'sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'
    echo "Or install it by git clone --recursive git@github.com:Eeemil/dotfiles.git"
fi
if [ -d "$DOTFILES/oh-my-zsh-custom" ]; then
    ZSH_CUSTOM="$HOME/dotfiles/oh-my-zsh-custom"
fi

# ┏━┓╻ ╻   ┏┳┓╻ ╻   ╺━┓┏━┓╻ ╻   ╺┳╸╻ ╻┏━╸┏┳┓┏━╸
# ┃ ┃┣━┫╺━╸┃┃┃┗┳┛╺━╸┏━┛┗━┓┣━┫    ┃ ┣━┫┣╸ ┃┃┃┣╸
# ┗━┛╹ ╹   ╹ ╹ ╹    ┗━╸┗━┛╹ ╹    ╹ ╹ ╹┗━╸╹ ╹┗━╸
# oh-my-zsh theme
# Set name of the theme to load --- if set to "random", it will load a random
# theme each time oh-my-zsh is loaded, in which case, to know which specific one
# was loaded, run: echo $RANDOM_THEME See
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Default fallback theme
ZSH_THEME="robbyrussell"
# Try to load powerlevel9k theme. If it isn't installed in
# .oh-my-zsh/custom/themes, try to find it in dotfiles and symlink it
if [ "$DUMBTERM" = "true" ]; then
    ZSH_THEME="robbyrussell"
elif [ -f "$ZSH_CUSTOM/themes/powerlevel9k/powerlevel9k.zsh-theme" ]; then
    ZSH_THEME="powerlevel9k/powerlevel9k"
fi
if [ -f "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" ]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Old (similar but but slower) theme, use "USE_9K=true zsh" if needed for
# fallback purposes
if [ "${USE_9K}" = "true" ]; then
    ZSH_THEME="powerlevel9k/powerlevel9k"
fi

if [ "$ZSH_THEME"="powerlevel10k/powerlevel10k" ]; then
    POWERLEVEL9K_MODE='nerdfont-complete'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false

    POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
    POWERLEVEL9K_ALWAYS_SHOW_USER=true

    POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="grey19"
    POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
    POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="blue3"
    autoload -Uz is-at-least
    if is-at-least 5.2.0; then
        # Older versions of ZSH goes fubar with these settings...
        POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="yellow3"
        POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=true
    else
        POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="yellow"
        POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=false
    fi


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

    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir_writable dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs status ssh aws kubecontext date time_joined)

    POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="magenta"
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="grey2"



    POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
    POWERLEVEL9K_STATUS_OK_BACKGROUND="navyblue"

    POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red1"
    POWERLEVEL9K_STATUS_ERROR_BACKGROUND="darkred"

    POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="dodgerblue1"
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="grey15"
    POWERLEVEL9K_EXECUTION_TIME_ICON="\u23F1"

    POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="green4"
    POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="grey15"

    POWERLEVEL9K_USER_ICON="\uF415" # 

    POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="magenta"
    POWERLEVEL9K_ROOT_ICON=$'\uF198'  # 

    POWERLEVEL9K_SSH_FOREGROUND="yellow"
    POWERLEVEL9K_SSH_BACKGROUND="red"
    POWERLEVEL9K_SSH_ICON="\uF489"  # 

fi

# ┏━┓╻ ╻   ┏┳┓╻ ╻   ╺━┓┏━┓╻ ╻   ┏━┓┏━╸╺┳╸╺┳╸╻┏┓╻┏━╸┏━┓
# ┃ ┃┣━┫╺━╸┃┃┃┗┳┛╺━╸┏━┛┗━┓┣━┫   ┗━┓┣╸  ┃  ┃ ┃┃┗┫┃╺┓┗━┓
# ┗━┛╹ ╹   ╹ ╹ ╹    ┗━╸┗━┛╹ ╹   ┗━┛┗━╸ ╹  ╹ ╹╹ ╹┗━┛┗━┛
# oh-my-zsh settings

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# ┏━┓╻ ╻   ┏┳┓╻ ╻   ╺━┓┏━┓╻ ╻   ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
# ┃ ┃┣━┫╺━╸┃┃┃┗┳┛╺━╸┏━┛┗━┓┣━┫   ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
# ┗━┛╹ ╹   ╹ ╹ ╹    ┗━╸┗━┛╹ ╹   ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛
# oh-my-zsh plugins

plugins=(colored-man-pages colorize)

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
if (( $+commands[yarn] )); then
    plugins+=(yarn)
fi
if (( $+commands[aws] )); then
    plugins+=(aws)
fi
if [ -d "$ZSH_CUSTOM/plugins/fzf" ]; then
    export FZF_BASE="$ZSH_CUSTOM/plugins/fzf"
    if (( $+commands[fzf] )); then
        plugins+=(fzf)
    else
        echo "Please install fzf for prettier command history with .$ZSH_CUSTOM/plugins/fzf/install"
    fi
fi
if [ -f "$ZSH_CUSTOM/plugins/zsh-completions/zsh-completions.plugin.zsh" ]; then
    plugins+=(zsh-completions)
fi
if [ -f "$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ]; then
    plugins+=(zsh-autosuggestions)
fi

# BE AWARE: MUST BE LOADED LAST
# BE AWARE: MUST BE LOADED LAST
# BE AWARE: MUST BE LOADED LAST
if [ -f "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" ]; then
    plugins+=(zsh-syntax-highlighting)
    # Due to the following issue:
    # https://github.com/zsh-users/zsh-syntax-highlighting/issues/295
    # Syntax highlighting is really slow when pasting long text. This speeds it
    # up to just a slight delay
    zstyle ':bracketed-paste-magic' active-widgets '.self-*'
fi
# ╻  ┏━┓┏━┓╺┳┓   ┏━┓╻ ╻   ┏┳┓╻ ╻   ╺━┓┏━┓╻ ╻
# ┃  ┃ ┃┣━┫ ┃┃   ┃ ┃┣━┫╺━╸┃┃┃┗┳┛╺━╸┏━┛┗━┓┣━┫
# ┗━╸┗━┛╹ ╹╺┻┛   ┗━┛╹ ╹   ╹ ╹ ╹    ┗━╸┗━┛╹ ╹
# load oh-my-zsh

if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

# ┏━╸╻ ╻┏━┓╺┳╸┏━┓┏┳┓   ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓
# ┃  ┃ ┃┗━┓ ┃ ┃ ┃┃┃┃   ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓
# ┗━╸┗━┛┗━┛ ╹ ┗━┛╹ ╹   ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛
# custom functions

cache_path() {
    printenv | grep -E '^PATH' > ~/tmp/zsh-path.zsh
}

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

_command_time_preexec() {
    timer=${timer:-$SECONDS}
    date_start=$(date '+%Y-%m-%d')
    time_start=$(date '+%H:%M:%S')
    ZSH_COMMAND_TIME_MSG=${ZSH_COMMAND_TIME_MSG-"Time: %s"}
    ZSH_COMMAND_TIME_COLOR=${ZSH_COMMAND_TIME_COLOR-"white"}
    export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
    if [ $timer ]; then
        timer_show=$(($SECONDS - $timer))
        date_end=$(date '+%Y-%m-%d')
        time_end=$(date '+%H:%M:%S')
        if [ -n "$TTY" ] && [ $timer_show -ge ${ZSH_COMMAND_TIME_MIN_SECONDS:-3} ]; then
            export ZSH_COMMAND_TIME="$timer_show"
            export ZSH_COMMAND_DATE_START="$date_start"
            export ZSH_COMMAND_TIME_START="$time_start"
            export ZSH_COMMAND_DATE_END="$date_end"
            export ZSH_COMMAND_TIME_END="$time_end"
            if [ ! -z ${ZSH_COMMAND_TIME_MSG} ]; then
                zsh_command_time
            fi
        fi
        unset timer
    fi
}

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME))
        sec_show=$(($ZSH_COMMAND_TIME%60))
        date_start="$ZSH_COMMAND_DATE_START"
        time_start="$ZSH_COMMAND_TIME_START"
        date_end="$ZSH_COMMAND_DATE_END"
        time_end="$ZSH_COMMAND_TIME_END"
        if [ "$sec" -le 30 ]; then
            return
        elif [ "$sec" -le 60 ]; then
            timer_show="$fg[green]$sec_show s."
        elif [ "$min" -le 5 ]; then
            timer_show="$fg[green]$min min. $sec_show s."
        elif [ "$min" -le 30 ]; then
            timer_show="$fg[yellow]$min min. $sec_show s."
        else
            if [ "$hours" -gt 0 ]; then
                min_show=$(($min%60))
                timer_show="$fg[red]$hours h. $min_show min. $sec_show s."
            else
                timer_show="$fg[red]$min min. $sec_show s."
            fi
        fi
        if [ ${date_start} != ${date_end} ]; then
            timer_show="${timer_show}$fg[default] (start: $fg[red]${date_start}$fg[default] ${time_start}, end: $fg[red]${date_end}$fg[default] ${time_end}$fg[default])"
        else
            timer_show="${timer_show}$fg[default] (start: ${time_start}, end: ${time_end})"
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

# simple notification
# Example use: when running a long-running command, just type "beep<enter>" and
# you will be notified when the command is done.
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
	# On local machine we can send sounds
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

# re-run a command until it succeeds
function waitforsuccess {
    local silent=false
    if [ "$1" = "--silent" ]; then
        silent=true;
        shift 1
    fi
    [ "$silent" = "false" ] && echo "Will run command '$@' until it returns 0"
    until eval "$@" &>/dev/null; do
        sleep 1
    done
    [ "$silent" = "false" ] && beep "Command finished: '$@'"
}

# read environment file and print its output
function .env {
    if [ ! -f ".env" ]; then
        echo "Error: no .env file found"
        return -1
    fi
    local envfile=${1:-".env"}
    echo "########## Loading ${envfile}..."
    if (( $+commands[pygmentize] )); then
        pygmentize -l bash ${envfile}
    else
        cat ${envfile}
    fi
    if [[ -o a ]]; then
      source ${envfile}
    else
      set -a
      source ${envfile}
      set +a
    fi
    echo "########## ${envfile} loaded"
}

# helper function that prints info to terminal if CD:ing into a dir with a .env
_dotenv_exists() {
    if [ -f ".env" ]; then
        echo "Local .env file exists. Load it with command \".env\""
    fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd _dotenv_exists

# alt+l is downcase word per "terminal emacs-like
# keybindings"-convention. However, oh-my-zsh binds alt+l to automatically run
# "ls". This: https://github.com/robbyrussell/oh-my-zsh/issues/5071 thread
# suggests a compromise: default to downcase-word, but if buffer is empty run
# ls.
function _magic-alt-l () {
    if [[ -z "$BUFFER" ]]; then
        BUFFER="ls -lah"
        zle accept-line
    else
        zle down-case-word
    fi
}
zle -N _magic-alt-l

bindkey '\el' _magic-alt-l

# Override default git command
# Using "git pull" is not very good. Lets get rid of that habit
function git {
    if [[ $@ == "pull" ]]; then
        command git pull --rebase=preserve
        echo "ran git pull --rebase=preserve. (https://adamcod.es/2014/12/10/git-pull-correct-workflow.html)"
    else
        command git $@
    fi
}

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

# recursively load all keys from ~/.ssh or $1
function ssh-agent-load-all-keys {
    local keypath=${1:-"$HOME/.ssh/"}
    if [ $+commands[ssh-agent] -eq 0 ]; then
        echo "Error: ssh-agent not installed"
        return 1
    fi
    if [ $+commands[ssh-add] -eq 0 ]; then
        echo "Error: ssh-add not installed"
        return 1
    fi

    keys=($(grep -Rlw "$keypath" -e "BEGIN.*PRIVATE KEY"))
    if [ -z $keys ]; then
        echo "No keys found..."
        return 0
    fi
    if [ ! -z "${SSH_AGENT_PID}" ] || [ ! -z "${SSH_AUTH_SOCK}" ]; then
        echo "Warning: SSH-AGENT already running with pid ${SSH_AGENT_PID}"
        echo 'Kill it with: eval "$(ssh-agent -k)"'
    else
        eval "$(ssh-agent -s)"
    fi
    for key in ${keys}; do
        echo "Running ssh-add ${key}"
        ssh-add "${key}"
    done
    nkeys=$(ssh-add -l | wc -l)
    if [ $nkeys -ge 6 ]; then
        echo "Warning, $nkeys loaded. Some SSHDs has a limit of trying 5 keys"
        echo "before rejecting a login. This means that the 6:th (and further)"
        echo "key wont be tried."
        echo "To mitigate this, delete some of the following keys:"
        ssh-add -l
        echo "Use ssh-add -d path-to-key"
    fi
}

_SECRET_FUNCTIONS="${HOME}/secret-functions.sh"
if [ -f "${_SECRET_FUNCTIONS}" ]; then
    function load-secrets {
        source "$_SECRET_FUNCTIONS"
    }
    zle -N load-secrets
    bindkey "\ev" load-secrets
fi

# See https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
function gen-random-string {
    LENGTH="${1:-16}"
    if [[ ! $LENGTH =~ "^[0-9]+$" ]]; then
        echo -e "Error: first argument not a number\nUsage: gen-random-string LENGTH" >&2; return 1
    fi
    </dev/urandom tr -dc 'A-Za-z0-9!#$%&\''()*+,-./:;<=>?@[\]^_`{|}~' | head -c ${LENGTH} | xargs -0 echo
}

function gen-random-string-alphanumeric {
    LENGTH="${1:-16}"
    if [[ ! $LENGTH =~ "^[0-9]+$" ]]; then
        echo -e "Error: first argument not a number\nUsage: gen-random-string LENGTH" >&2; return 1
    fi
    </dev/urandom tr -dc 'A-Za-z0-9' | head -c ${LENGTH} | xargs -0 echo
}


# Repeat a command
function repeating-cmd {
    function usage {
        echo "$0 FREQUENCY COMMAND COMMAND_ARGS"
        echo "  FREQUENCY should be on the format \"1h 3m 1s"
    }
    FREQUENCY=${1:-"5m"}
    CMD=${2:-"notify-send"}
    shift 2
    ARGS=$@
    S_HOURS=$(sed -E 's/([^Hh]+[^0-9]|^[^0-9]*)([0-9]+)([Hh].*$)/\2/') <<< "$FREQUENCY"
    S_MINUTES=$(sed -E 's/([^Mm]+[^0-9]|^[^0-9]*)([0-9]+)([Mm].*$)/\2/') <<< "$FREQUENCY"
    S_SECONDS=$(sed -E 's/([^Ss]+[^0-9]|^[^0-9]*)([0-9]+)([Ss].*$)/\2/') <<< "$FREQUENCY"
    echo -e "S_SECONDS $S_SECONDS\nS_MINUTES = $S_MINUTES\nS_HOURS = $S_HOURS"
    [[ ! $S_HOURS =~ '^[0-9]+$' ]] && S_HOURS=0
    [[ ! $S_MINUTES =~ '^[0-9]+$' ]] && S_MINUTES=0
    [[ ! $S_SECONDS =~ '^[0-9]+$' ]] && S_SECONDS=0
    TOTAL_SECONDS=$(( S_SECONDS + 60*S_MINUTES + 60*60*S_HOURS ))
    printf "repeating-${CMD}" >! /proc/$$/comm
    echo "Repeating (every $TOTAL_SECONDS seconds) command $CMD $ARGS"
    while :
    do
        $CMD $ARGS
        sleep $TOTAL_SECONDS
    done
}

function ocr-screenshot {
    img=$(mktemp --suffix=".png")
    txt=$(mktemp)
    gnome-screenshot -a -f ${img}

    mogrify -modulate 100,0 -resize 400% ${img}
    #should increase detection rate

    tesseract ${img} ${txt} --psm 10
    cat ${txt}.txt | xclip -selection clipboard
}

# Usage:
# toggle-window-decorations [-i] [on|off|toggle]
# Hides/shows window decorations of current window
# Flags:
#   -i: interactive (prompt for window)
# More: https://askubuntu.com/questions/906424/remove-decoration-of-single-window-in-gnome-3
function toggle-window-decorations {
    local window=""
    if [ "$1" = "-i" ]; then
        echo "Select window with mouse"
        window=$(xwininfo | grep "Window id: " | grep -oP "0x[0-9a-f]*")
        shift 1
    else
        # Use active window
        window=$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)
    fi
    local desired_state="${1:-toggle}"
    local current_state=$(xprop -id $window -f _MOTIF_WM_HINTS 32c | grep "_MOTIF_WM_HINTS(CARDINAL)")
    if [ "$current_state" = "_MOTIF_WM_HINTS(CARDINAL) = 2, 0, 0, 0, 0" ]; then
        current_state="off"
    elif [ "$current_state" = "_MOTIF_WM_HINTS(CARDINAL) = 2, 0, 1, 0, 0" ]; then
        current_state="on"
    else
        # Default, assume on
        current_state="on"
    fi
    if [ "$desired_state" = "toggle" ]; then
        if [ "$current_state" = "off" ]; then
            desired_state="on"
        else
            desired_state="off"
        fi
    fi
    echo "$current_state" "$desired_state"
    if [ "$desired_state" = "on" ]; then
        xprop -id "$window" -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x1, 0x0, 0x0"
    elif [ "$desired_state" = "off" ]; then
        xprop -id "$window" -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
    else
        echo "Unknown desired state \"$desired_state\" ¯\_(ツ)_/¯"
    fi
}

# ┏━╸╻ ╻┏━┓╺┳╸┏━┓┏┳┓   ┏━┓╻  ╻┏━┓┏━┓┏━╸┏━┓
# ┃  ┃ ┃┗━┓ ┃ ┃ ┃┃┃┃   ┣━┫┃  ┃┣━┫┗━┓┣╸ ┗━┓
# ┗━╸┗━┛┗━┛ ╹ ┗━┛╹ ╹   ╹ ╹┗━╸╹╹ ╹┗━┛┗━╸┗━┛
# custom aliases

# kubectl switch ns easily
alias kns='kubectl config set-context $(kubectl config current-context) --namespace '
alias xclip='xclip -r -selection c'
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

if (( $+commands[rg] )); then
    alias rgd='rg --glob=!dist/'
fi

# use python3 if available
if (( $+commands[pip3] )); then
    alias pip=pip3
fi
if (( $+commands[python3] )); then
    alias python=python3
fi

alias e=emacsclient
alias g=git

alias datee="date '+%Y-%m-%d_%H:%M'"

# yaml parsing for humanz
alias yml='pygmentize -P style=monokai -l yaml'
alias ymll='pygmentize -P style=monokai -l yaml | less'
alias -g oyml=' -o yaml | yml'
alias -g oymll=' -o yaml | ymll'

# json parsing for humanz
alias json='python -m json.tool'
alias jsonn='python -m json.tool | pygmentize -l json'
alias jsonl='python -m json.tool | pygmentize -l json | less'

# Jag är less på less med oläsbara färger (note: this is a swedish pun)
# -b = buffer bytes in kibibytes (1024KiB*128=128MiB=131072)
alias less="TERM=xterm less -b 131072"

# zfs may list LOADS of docker layer images as datasets on the form
# "/var/lib/[IMAGEID]", hide them plz
alias -g znodocker='| grep -vE "/var/lib/[a-z0-9]{64}"'

# ┏━╸╻ ╻┏━┓╺┳╸┏━┓┏┳┓  ┏━╸┏┓╻╻ ╻╻┏━┓┏━┓┏┓╻┏┳┓┏━╸┏┓╻╺┳╸  ╻ ╻┏━┓┏━┓╻┏━┓┏┓ ╻  ┏━╸┏━┓
# ┃  ┃ ┃┗━┓ ┃ ┃ ┃┃┃┃  ┣╸ ┃┗┫┃┏┛┃┣┳┛┃ ┃┃┗┫┃┃┃┣╸ ┃┗┫ ┃   ┃┏┛┣━┫┣┳┛┃┣━┫┣┻┓┃  ┣╸ ┗━┓
# ┗━╸┗━┛┗━┛ ╹ ┗━┛╹ ╹  ┗━╸╹ ╹┗┛ ╹╹┗╸┗━┛╹ ╹╹ ╹┗━╸╹ ╹ ╹   ┗┛ ╹ ╹╹┗╸╹╹ ╹┗━┛┗━╸┗━╸┗━┛
# custom environment variables

export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""

export GOPATH=$HOME/.go/workspace
export GEM_HOME=$HOME/gems
# Node version manager
export NVM_DIR="$HOME/.nvm"

if (( $+commands[rg] )); then
    # Ripgrep configuration file
    # https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
    export RIPGREP_CONFIG_PATH=$DOTFILES/.ripgreprc
fi

# Force non-deprecated python in gcloud et. al.
if (( $+commands[gcloud] )); then
    export CLOUDSDK_PYTHON=python3
    export CLOUDSDK_GSUTIL_PYTHON=python3
    export CLOUDSDK_BQ_PYTHON=python3
fi
# ┏━┓┏━┓╺┳╸╻ ╻
# ┣━┛┣━┫ ┃ ┣━┫
# ╹  ╹ ╹ ╹ ╹ ╹
# path

export PATH="${HOME}/.yarn/bin/:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
# Ruby might be fun
export PATH="${HOME}/.rbenv/bin:${PATH}"
if (( $+commands[rbenv] )); then
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# Yarn: js/ts package manager
if (( $+commands[yarn] )); then
    export PATH="$PATH:$(yarn global bin)"
fi

# Anaconda: Python/ML stuff
# Contains A LOT of binaries conflicting with system binaries (such as python
# and curl) so lets load it manually whenever I type "anaconda" in terminal
function anaconda {
    echo $PATH | grep "/anaconda3/bin" &>/dev/null
    if [ $? -ne 0 ]; then
        export PATH=$HOME/anaconda3/bin:$PATH
    fi
    #unload this function "anaconda" so that binary "anaconda" can be used
    unset -f anaconda
    echo 'Anaconda binaries added to $PATH'
}

# Go
export PATH=$PATH:$GOPATH/bin

# Less with syntax highlighting if pygmentize is available
if (( $+commands[pygmentize] )); then
    export LESSOPEN="| pygmentize %s 2>/dev/null"
fi

# ╺━┓┏━┓╻ ╻   ┏┓ ┏━╸╻ ╻┏━┓╻ ╻╻┏━┓╻ ╻┏━┓
# ┏━┛┗━┓┣━┫   ┣┻┓┣╸ ┣━┫┣━┫┃┏┛┃┃ ┃┃ ┃┣┳┛
# ┗━╸┗━┛╹ ╹   ┗━┛┗━╸╹ ╹╹ ╹┗┛ ╹┗━┛┗━┛╹┗╸
# zsh behavior / zsh behaviour

# Fuzzy completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# ┏━┓┏━╸┏━┓   ╻ ╻┏━┓┏━┓╺┳╸   ┏━╸┏━┓┏┓╻┏━╸╻┏━╸
# ┣━┛┣╸ ┣┳┛╺━╸┣━┫┃ ┃┗━┓ ┃    ┃  ┃ ┃┃┗┫┣╸ ┃┃╺┓
# ╹  ┗━╸╹┗╸   ╹ ╹┗━┛┗━┛ ╹    ┗━╸┗━┛╹ ╹╹  ╹┗━┛
# per-host config

# At university?
if [ "$(hostname -d)" = "cs.umu.se" ]; then
    # ctrl+d = leave shell
    unsetopt ignoreeof
fi

# Local configuration?
if [ -f "${HOME}/.locals.zsh" ]; then
    source ${HOME}/.locals.zsh
fi

# ┏━┓╺┳╸╻ ╻┏━╸┏━┓   ┏━┓╺┳╸╻ ╻┏━╸┏━╸
# ┃ ┃ ┃ ┣━┫┣╸ ┣┳┛   ┗━┓ ┃ ┃ ┃┣╸ ┣╸
# ┗━┛ ╹ ╹ ╹┗━╸╹┗╸   ┗━┛ ╹ ┗━┛╹  ╹
# other stuff

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fpath=("${DOTFILES}/zsh/completions" "${DOTFILES}/zsh/functions" $fpath)
autoload -U compinit && compinit

# Cleanup duplicates from PATH
typeset -aU path

# C-w = kill-region (copy marked region)
bindkey "\C-w" kill-region

# Velero completion
if (( $+commands[velero] )); then
    source <(velero completion zsh)
fi
