# PATH
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.npm-global/bin

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

# Add folders to zsh fpath
fpath=(~/.zsh/completions $fpath)

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mhdahmad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom
# Print empty line after every prompt, except the first
precmd() {
    precmd() {
        echo ""
    }
}

# Plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Variables
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!{node_modules/*,.git/*,.var/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 75% --layout=reverse'
export JAVA_HOME='/usr/lib/jvm/java-openjdk'
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Aliases
alias yarn='yarnpkg'
alias ls='lsd'
alias vim='nvim'
alias nethogs='sudo nethogs'

# Load Spaceship ZSH theme
eval "$(starship init zsh)"