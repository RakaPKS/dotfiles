export XDG_CONFIG_HOME="$HOME/.config"

# Set zinit location and install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
#zinit snippet OMZP::rust
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Aliasses
alias ls='lsd'
alias lsa='lsd -a'
alias lsl='lsd -la'
alias cl='clear'
alias cat='bat'
alias vim='nvim'
alias vi='nvim'
alias pupdate='paru -Syu'
alias theme='toggle_theme'

# ~/.config/zsh/theme_mode.zsh
THEME_CATPPUCCHIN="$XDG_CONFIG_HOME/zsh/zsh-catppuccin-macchiato"
THEME_SOLARIZED_LIGHT="$XDG_CONFIG_HOME/zsh/zsh-solarized-light"
THEME_MODE_FILE="$XDG_CONFIG_HOME/zsh/theme_mode"

function load_theme() {
    if [ -f "$THEME_MODE_FILE" ]; then
        THEME_MODE=$(cat "$THEME_MODE_FILE")
    else
        THEME_MODE="dark"
        echo "$THEME_MODE" > "$THEME_MODE_FILE"
    fi

    if [[ $THEME_MODE == "dark" ]]; then
        source $THEME_CATPPUCCHIN
    else
        source "$THEME_SOLARIZED_LIGHT"
    fi
}

function toggle_theme() {
    if [[ $THEME_MODE == "dark" ]]; then
        THEME_MODE="light"
        source "$THEME_SOLARIZED_LIGHT"
        echo "Solarized Light activated"
    else
        THEME_MODE="dark"
        source $THEME_CATPPUCCHIN
        echo "Catppuccin Macchiato activated"
    fi

    echo $THEME_MODE > "$THEME_MODE_FILE"
}

load_theme

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no


#nodejs
export PATH=~/.npm-global/bin:$PATH
source /usr/share/nvm/init-nvm.sh
export PATH=/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:$PATH
export PATH=/home/raka/.local/bin:$PATH

#cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
