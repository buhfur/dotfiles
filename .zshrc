# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Check if zinit is installed,  if not , install 
if [[ ! -d ~/.local/share/zinit/ ]]; then
    echo "INFO: No zinit installation detected. Installing..."
    sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

# Start zinit ? 
source ~/.local/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit

#Check if oh-my-zsh is installed 
if ! [[ -a $HOME/.oh-my-zsh/oh-my-zsh.sh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Zsh theme 
#ZSH_THEME="mira"
# Plugin list
plugins=(
    #git
    #zsh-autosuggestions
    #fzf
    colored-man-pages
    #zsh-completions
)

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light junegunn/fzf
zinit light rupa/z
zinit light romkatv/powerlevel10k
# Fpath config for completions 
source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/vim
export PATH=$PATH:$HOME/.config/rofi/scripts/
export FZF_BASE=/usr/bin/fzf

# Removes annoying highlighting from ls 
export LS_COLORS="di=34:ln=36:so=32:pi=33:ex=31:bd=33;01:cd=33;01:su=37;41:sg=30;43:tw=30;42:ow=00"

# Uncomment this if the autocompletions starts acting up 
#setopt NO_CORRECT
bindkey '^I' autosuggest-accept



### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

