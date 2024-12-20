
alias i3conf='vim ~/.config/i3/config'
alias polyconf='ranger ~/.config/polybar/'
alias piconf='vim ~/.config/picom/picom.conf'
alias ri3='i3-msg reload ; i3-msg restart'
alias logoff='sudo pkill -u $USER'
alias alaconf='vim ~/.config/alacritty/alacritty.toml'
alias twow='wine $HOME/turtle/VanillaFixes.exe'
alias zconf='vim ~/.zshrc'
alias zenv='vim ~/.zshenv'
alias soenv='source ~/.zshenv'
alias sozsh='source ~/.zshrc'
alias notes='ranger $HOME/buhfur.github.io/notes'
alias todo='vim $HOME/buhfur.github.io/todo/todo.md -p $HOME/buhfur.github.io/todo/wowtodo.md '
alias updg='sudo apt -y update && sudo apt -y upgrade'
alias roficonf='ranger ~/.config/rofi'
alias rls='sudo systemctl daemon-reload'
alias sys='sudo systemctl'
alias gp='git status && git pull && git add . && git commit -am"Auto Commit: $(date)" && git push'
# SSH aliases
alias proxmox='ssh root@proxmox'
alias mediaserver='ssh media-user@media-server'
alias buhfurpc='ssh buhfur@buhfur-pc'
alias hist='history'
alias disc='discordo'

# EXPORTS 
export EDITOR
export EDITOR=/usr/bin/vim
export SYSTEMD_EDITOR=/usr/bin/vim # systemctl edit <unit-name>
export PATH=$PATH:$HOME/.config/rofi/scripts/
export FZF_BASE=/usr/bin/fzf
export ZSH=$HOME/.oh-my-zsh
export LS_COLORS="di=34:ln=36:so=32:pi=33:ex=31:bd=33;01:cd=33;01:su=37;41:sg=30;43:tw=30;42:ow=00" # Removes annoying highlighting from ls 

