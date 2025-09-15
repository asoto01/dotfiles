# My Dotfiles

These are my personal configuration files for various command-line tools. The goal is to keep them in one place to easily set up a new machine.

***

## Configurations

This repository contains the settings for the following tools:

* **Zsh** (`.zshrc`): Shell configuration, aliases, and prompt settings.
* **Neovim** (`init.lua`): Editor settings using Lua.
* **Tmux** (`.tmux.conf`): Terminal multiplexer configuration.
* **iTerm2** (`iterm2-settings.itermexport`): macOS terminal settings.

***

## Setup

To use these configurations, clone the repository and create symbolic links from your home directory to the files located here.

```bash
# Example for .zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

# Example for Neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua
