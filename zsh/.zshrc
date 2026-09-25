

# setopt histignorealldups sharehistory

# export DOTNET_ROOT=$HOME/.dotnet
# export PATH=$HOME/.dotnet:$PATH
export DOTNET_CLI_TELEMETRY_OPTOUT=1



# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
#bindkey '^B' autosuggest-toggle

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Alias
alias d='docker'
alias dc='docker compose'
#alias ls='lsd'
alias ls="ls --color=auto"

# Extensions
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh   

# Paths
export PATH="${PATH}:/home/$(whoami)/.local/bin"
export XDG_DATA_DIRS="${PATH}:/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share"
export XDG_CONFIG_HOME="/home/$(whoami)/.config"

# Add .local to the path
#export PATH="${PATH}:/home/$(whoami)/.local/bin"

# Add flatpaks to search dir
#export PATH="${PATH}:/home/$(whoami)/.local/share/flatpak/exports/share"
# export PATH="${PATH}:/var/lib/flatpak/exports/share"
# export XDG_DATA_DIRS="${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share/:/home/$(whoami)/.local/share/flatpak/exports/share"


if [ -e /home/andrew/.nix-profile/etc/profile.d/nix.sh ]; then . /home/andrew/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Set up the prompt
eval "$(starship init zsh)"
