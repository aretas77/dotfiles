#!/bin/sh

setup_ohmyzsh_theme()
{
	themes_dir=${ZSH_CUSTOM}/themes
	powerlevel10k_dir=${ZSH_CUSTOM}/themes/powerlevel10k

	if [ ! -d "${themes_dir}" ]; then
		return
	fi

	if [ -d "${powerlevel10k_dir}" ]; then
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${powerlevel10k_dir}"
	fi
}

setup_ohmyzsh()
{
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

setup_zsh()
{
	setup_ohmyzsh
	setup_ohmyzsh_theme
}

setup_tmux()
{
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}


# used apps
apps=(git curl)

setup_tmux
