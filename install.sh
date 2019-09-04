update_arch(){
	yay
}
install_alacritty(){
	if ! type alacritty > /dev/null; then
		echo "installing alacritty"
		sudo pacman -Sy alacritty
	else
		echo "alacritty is already installed"
	fi
}
install_betterlockscreen(){
	if ! type betterlockscreen > /dev/null; then
		echo "installing betterlockscreen"
		sudo yay -Sy betterlockscreen
	else
		echo "betterlockscreen is already installed"
	fi
}
install_curl(){
	if ! type curl > /dev/null; then
		echo "installing curl"
		sudo pacman -Sy curl
	else
		echo "curl is already installed"
	fi
}
install_nvim(){
	if ! type nvim > /dev/null; then
		echo "installing neovim"
		sudo pacman -Sy neovim
	else
		echo "neovim is already installed"
	fi
}
install_rofi(){
	if ! type rofi > /dev/null; then
		echo "installing rofi"
		sudo pacman -Sy rofi
	else
		echo "rofi is alacritty installed"
	fi
}
install_tmux(){
	if ! type tmux > /dev/null; then
		echo "installing tmux"
		sudo pacman -Sy tmux
	else
		echo "tmux is already installed"
	fi
}
install_vim(){
	if ! type vim > /dev/null; then
		echo "installing vim"
		sudo pacman -Sy vim
	else
		echo "vim is already installed"
	fi
}
install_zsh(){
	if ! type zsh > /dev/null;then
		echo "installing zsh"
		sudo pacman -Sy zsh
		sudo chsh -s $(which zsh)
		# install ohmyzsh
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	else
		echo "zsh is already installed"
	fi
}
###############################################################################
#
###############################################################################

# UPDATE ARCH
echo "Do you wish to update arch ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) update_arch; break;;
		No ) break;;
	esac
done
# Declare an array of string with type
declare -a Apps=("alacritty" "betterlockscreen" "curl" "nvim" "rofi" "tmux" "vim" "zsh" )
# Iterate the string array using for loop
for val in ${Apps[@]}; do
	echo "Do you wish to update $val ?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) install_$val; break;;
			No ) break;;
		esac
	done
done

# ln ./alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
# ln ./betterlockscreen/betterlockscreenrc ~/.config/betterlockscreen/betterlockscreenrc
# ln ./i3/config ~/.config/i3/config
# ln ./nvim/.vimrc ~/.config/nvim/init.vim
