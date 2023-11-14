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

Vim configuration comes with
[vim-commentary](https://github.com/tpope/vim-commentary) and
[auto-pairs](https://github.com/jiangmiao/auto-pairs)


# Installation

## Makefile

You can install it using the `Makefile`. There are several options for this
method.

**Terminology**

- Install: Create a backup of current dotfile and create a symlink to a dotfile
  from this repository
- Copy: Create a backup of current dotfile and copy a dotfile from this repository
- Substitute: Delete current dotfile and copy a dotfile from this repository

```bash
# Show help message
make

# Install all available dotfiles
make install

# Substitute all available dotfiles. WARNING: THIS WILL DELETE CURRENT DOTFILES
make substitute

# Copy all available dotfiles.
make copy            

# Install only a specific dotifile e.g. "bash_install"
make foo_install

# Substitute only a specific dotifile e.g. "bash_substitute"
make foo_substitute

# Copy only a specific dotifile e.g. "bash_copy"
make foo_copy

# List available dotfiles in this repository
make list
```


## GNU Stow

You can use [GNU Stow](https://www.gnu.org/software/stow/) using the
`--dotfiles` flag, however, if there's already a configuration file in the
system of any the tools and/or shells used here you will need to delete or
create a backup of this files manually.


# To Do

- Make uninstall function to restore previous configuration.
