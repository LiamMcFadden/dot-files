#!/bin/bash

# Updates da dot-files #

# invoke with '-t' to update terminal settings (invoke as second argument) #
# invoke with '-e' to update external files #
# invoke with '-r' to update repo files #

update_term=false

if [[ $2 = "-t" ]]; then
    $update_term=true
fi

# update external files #
if [[ $1 = "-e" ]]; then
   cp -r ./bash_profile ./bashrc ./dircolors ./mydircolors ./tmux.conf ./vim ./vimrc ./zshrc ~/

   if [[ $update_term = true ]]; then
       cp ./settings.json /mnt/c/Users/$3/Appdata/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState/settings.json 
   fi

# update repo files #
elif [[ $1 = "-r" ]]; then
   cp -r ~/bash_profile ~/bashrc ~/dircolors ~/mydircolors ~/tmux.conf ~/vim ~/vimrc ~/zshrc ./

   if [[ $update_term = true ]]; then
       cp /mnt/c/Users/$3/Appdata/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState/settings.json ./
   fi

else
    echo "./update [-e/-r] (-e for update external/-r for update repo) [-t] (update term settings) [win. user name]"
fi

