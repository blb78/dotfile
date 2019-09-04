# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH="/home/blb/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# z autojump
. ~/.config/z/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
# export FZF_DEFAULT_OPTS=" --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export GOPATH=/usr/lib/go
# alias tmux='tmux -2'
# Run tmux when starting terminal
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

export CELLAR_ADDON_HOST=cellar.services.clever-cloud.com
export CELLAR_ADDON_KEY_SECRET=Js7dwLUOS3TtOApedZga44ZuSqitIWZN49xusA==
export CELLAR_ADDON_KEY_ID=2DIGCHF-DITYTZOS4LM8

# plateform-manager
export GL_PRIVATE_TOKEN=w63WmdUvoqn1FBSMRyXk
export GL_GROUP_ID=3201404
export CELLAR_HOST=cellar.services.clever-cloud.com
export CELLAR_KEY=2DIGCHF-DITYTZOS4LM8
export CELLAR_SECRET=Js7dwLUOS3TtOApedZga44ZuSqitIWZN49xusA==
export CLEVER_CONSUMER_KEY=oR5lFOlaTDRVSaQL189lAH5qoJbTBt
export CLEVER_CONSUMER_SECRET=OE2MoizvSVdFdmJ21hSnpHoSEhfyF9
export CLEVER_TOKEN=eaaf15ae601340679e91fe71354a2302
export CLEVER_SECRET=0cf1d514bf1e45f0a6c7cb1ce8c328a4
export CLEVER_ORGANIZATION=orga_3ae718b0-8a4d-4c14-a49b-65f2b8bdfcd4
