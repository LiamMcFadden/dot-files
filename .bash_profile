# sh_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=~/bin:$PATH:./:/mnt/c/Program\ Files/Common\ Files/Oracle/Java/javapath:/mnt/c/Program\ Files/Common\ Files/Oracle/Java/javapath

export PATH

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
