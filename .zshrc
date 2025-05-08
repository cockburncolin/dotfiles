ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

alias cat=bat
alias vim=nvim
alias ls=exa --colour=always --icons=always --classify=always

zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light reobin/typewritten

zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::github
zinit snippet OMZP::lol
zinit snippet OMZP::sudo


# load completions
autoload -U compinit && compinit
zinit cdreplay -q

# disable beeps
unsetopt BEEP

# history settings
HISTSIZE=2500
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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

bindkey '^H' backward-kill-word

eval "$(direnv hook zsh)"
# eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(fzf --zsh)"
