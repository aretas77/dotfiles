dotfiles
========

Here I keep my collection of personal dotfiles. These dotfiles are currently in progress so there will be a lot of changes coming in.

My dotfiles will be focused mainly on:

* Programming with C/C++.
* Kernel development.
* Some git config magic.
* Some eye-candy.
* Fully compatible with my Dell XPS 9570 laptop.

Installation
------------

Clone this repository:

	git clone https://github.com/aretas77/dotfiles.git ~/.dotfiles

### Using [GNU Stow](https://www.gnu.org/software/stow/) _(recommended)_

This method was discovered by researching other people dotfile repositories and it seemed like a quite convenient way to manage dotfiles. Special thanks to [edbizarro](https://github.com/edbizarro) from whom I discovered this method and borrowed some very cool dotfiles.

Install GNU Stow _(if not already installed)_

	Arch:		pacman -S stow
	Ubuntu:	apt-get install stow

Then, use stow to symlink the dotfiles you want to use, example:

	stow xresources
