# About
Minimalist configuration files for some shells and tools that I commonly use.

These should work right out of the box without installing aditional plugins or
packages and should work in most of the systems.

## Disclaimer
These configuration files are for my personal use so probably most of the
configuration might not suit your needs, but feel free to grab some ideas to
apply to your own configuration or whatever.

## Current tools and shells
- bash
- zsh
- tmux
- vim

# Installation
Use **copy_config.sh** script to copy all the configuration. This script creates
symlinks pointing to the files in this repository in the location where the
configuration file of the tool or shell should be located, the same way in which
[GNU Stow](https://www.gnu.org/software/stow/) does it.

If there's already a configuration file in the system of any the tools and/or
shells used here, this script will change the name of the existing file adding
".bak" suffix.

```
bash copy_config.sh
```

In fact, you could use GNU stow directly using the --dotfiles flag, however, if
there's already a configuration file in the system of any the tools and/or shells
used here you will need to delete or create a backup of this files manually.


# Restoring configuration files
Use **restore_config.sh** script

```
bash restore_config.sh
```

This script deletes the symlinks of the configuration files created with
copy_config.sh script and restores the previous configuration by deleting the
suffix ".bak" from the original configuration files.

# To Do
- Add an argument to the copy_config.sh script so you can only copy the
  configuration of certain tools instead of copying the configuration of all the
  tools and shells.
- Add an argument to the copy_config.sh script to delete the current tools and
  shells configuration of the system and copy the configuration files instead of
  creating symlinks.

