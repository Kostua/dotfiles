# The best way to store your dotfiles: A bare Git repository
Your dotfiles might be the most important files on your machine!

```
          _           _      __   _   _              
       __| |   ___   | |_   / _| (_) | |   ___   ___ 
      / _` |  / _ \  | __| | |_  | | | |  / _ \ / __|
  _  | (_| | | (_) | | |_  |  _| | | | | |  __/ \__ \
 (_)  \__,_|  \___/   \__| |_|   |_| |_|  \___| |___/
                                                     
```

# Setup    
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
config config --local status.showUntrackedFiles no
```
Line 1 creates the folder .cfg, a bare Git repository which will be used to track our dotfiles.

Line 2 creates an alias named config which allows you to send git commands to the .cfg repository from any location, even outside of the repository.
It also configures the initially bare .cfg repository to set $HOME as the work tree, and store the Git state at .cfg

Line 3 Makes the config alias permanently available, so that you don't have to run line 2 every time you start a new shell session. You can either manually paste this alias or use line 3 for convenience, replacing .zsh/aliases with your chosen alias file.
If you use the zsh setup, your .zshrc file must load in the alias file with source $HOME/.zsh/aliases.

Line 4 sets a local configuration in .cfg to ignore untracked files.

# How its work

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .zshrc
config commit -m "Add zshrc"
config push
```
# Install your dotfiles onto a new system (or migrate to this setup)

- Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
- And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
```
echo ".cfg" >> .gitignore
```
- Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
```
git clone --bare <git-repo-url> $HOME/.cfg
```
- Define the alias in the current shell scope:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
- Checkout the actual content from the bare repository to your $HOME:
```
config checkout
```
- Set the flag showUntrackedFiles to no on this specific (local) repository:
```
config config --local status.showUntrackedFiles no
```
## Inspiration

[- The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) 

## Status
Project is: _finished_

## Contact
Created by [@kostua](mailto:kostua.p@gmail.com)- feel free to contact me!

