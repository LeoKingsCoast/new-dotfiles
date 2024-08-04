# Created by newuser for 5.9

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# print a space between prompts
precmd() { print "" }

# prepare variable for git version control
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git*' formats '%F{green}( %b%u%c%F{green})%f' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}!'
zstyle ':vcs_info:*' enable git

# Allow autocompletion selection
autoload -Uz compinit
setopt PROMPT_SUBST
compinit
zstyle ':completion*' menu select

# Aliases
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias ll='ls -Alh'
# alias ls="lsd --group-dirs first"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fzf="fzf --preview 'batcat --style=numbers --color=always {}"

# Prompt style
PROMPT='%B%F{cyan}󰣇 %n %B%F{015}%~ ${vcs_info_msg_0_} %B%F{006}%b%F{015} '

# Plugins
source $HOME/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Function to make yazi exit on current directory. Found in https://yazi-rs.github.io/docs/quick-start
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function bats ()
{
  BATS_RUN_SKIPPED=true command bats *.bats
}

function icu ()
{
  cd $(sauron)
}
