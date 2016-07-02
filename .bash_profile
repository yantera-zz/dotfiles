# .bash_profile
cowsay -f $(ls /usr/share/cowsay/ | shuf -n 1 | cut -d. -f1) 'HELLO!!'
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
