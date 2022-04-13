#!/bin/bash

# Updates da dot-files #

# -t not currently working... #
# invoke with '-t' to update terminal settings (invoke as second argument) #
# invoke with '-e' to update external files #
# invoke with '-r' to update repo files #

update_term=false

if [[ $2 = "-t" ]]; then
    $update_term = true
fi

# update external files #
if [[ $1 = "-e" ]]; then
   # create backup of current files and store in ./backup
   mkdir backup
   cp -R ~/.bash_profile ~/.bashrc  ~/.tmux.conf ~/.vim ~/.vimrc ~/.zshrc ./backup

   cp -R ./.bash_profile ./.bashrc ./.tmux.conf ./.vim ./.vimrc ./.zshrc ~/

   if [[ $update_term = true ]]; then
       cp ./settings.json /mnt/c/Users/$3/Appdata/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/settings.json 
   fi

# update repo files #
elif [[ $1 = "-r" ]]; then
   cp -R ~/.bash_profile ~/.bashrc  ~/.tmux.conf ~/.vim ~/.vimrc ~/.zshrc ./

   if [[ $update_term = true ]]; then
       cp /mnt/c/Users/$3/Appdata/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState/settings.json ./
   fi

elif [[ $1 = "--restore" ]]; then
    cp -a ./backup/. ~/


else
    echo "./update [-e/-r/--restore] [-e for update external/-r for update repo/--restore to restore previous files] [-t] (update term settings) [win. user name]"
fi

