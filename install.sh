update_arch(){
	yay
}
install_yay(){
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay/
}
install_ohmyzsh(){
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}
generate_ssh(){
	read -p "Enter your github email: " email
	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}

run_pacman(){
	if ! type $1 > /dev/null; then
		echo -e "\e[33minstalling $1\e[0m"
		sudo pacman -Sy $1
	else
		echo -e "\e[32m$1 is already installed\e[0m"
	fi
}
run_yay(){
	if ! type $1 > /dev/null; then
		echo -e "\e[33minstalling $1\e[0m"
		yay -Sy $1
	else
		echo -e "\e[32m$1 is already installed\e[0m"
	fi
}
clone_dotfile(){
	read -p "Directory path ? : " DIRECTORY
	git clone git@github.com:blb78/dotfile.git ~/dev/
	cd ~/dev/dotfile/
	if [ -f "~/.config/alacritty/alacritty.yml" ]; then
		rm ~/.config/alacritty/alacritty.yml
	fi
	ln ./alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	if [ -f "~/.config/betterlockscreen/betterlockscreenrc" ]; then
		rm ~/.config/betterlockscreen/betterlockscreenrc
	fi
	ln ./betterlockscreen/betterlockscreenrc ~/.config/betterlockscreen/betterlockscreenrc
	if [ -f "~/.config/i3/config" ]; then
		rm ~/.config/i3/config
	fi
	ln ./i3/config ~/.config/i3/config
	if [ -f "~/.config/nvim/init.vim" ]; then
		rm ~/.config/nvim/init.vim
	fi
	ln ./nvim/.vimrc ~/.config/nvim/init.vim
}
# UPDATE ARCH
echo "Do you wish to update arch ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) update_arch; break;;
		No ) break;;
	esac
done
echo "Do you whish to install yay ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) install_yay;break;;
		No ) break;;
	esac
done
declare -a PacmanApps=("alacritty" "curl" "nvim" "openssh" "powerline" "powerline-fonts" "rofi" "tmux" "vim" "wget" "xclip" "zsh")
for val in ${PacmanApps[@]}; do
	echo "Do you wish to install $val ?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) run_pacman $val; break;;
			No ) break;;
		esac
	done
done
echo "Do you wish to install OhMyZsh ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) install_ohmyzsh; break;;
		No ) break;;
	esac
done
declare -a YayApps=("betterlockscreen")
for val in ${YayApps[@]}; do
	echo "Do you wish to install $val ?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) run_yay $val; break;;
			No ) break;;
		esac
	done
done
# Generate SSH key on github
echo "Do you wish to generate github's ssh key ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) generate_ssh; break;;
		No ) break;;
	esac
done
# Clone my dotfile repo
echo "Do you wish to install your dotfile repository ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) clone_dotfile; break;;
		No ) break;;
	esac
done

