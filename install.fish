#!/usr/bin/env fish

set cwd (pwd)

mv ~/.config/fish ~/.config/fish-bkp
ln -s $cwd ~/.config/fish

echo "Don't forget to install cowfile from https://owl.pics/misc/owl.cow.txt"
