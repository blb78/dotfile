update_arch(){
	yay
}
install_yay(){
	if ! type yay > /dev/null; then
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		cd ..
		rm -rf yay/
	else
		echo -e "\e[32myay is already installed\e[0m"
	fi
}
install_ohmyzsh(){
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}
install_z(){
	wget -L https://raw.githubusercontent.com/rupa/z/master/z.sh
	sudo chmod +x z.sh
	mkdir ~/.config/z
	mv z.sh ~/.config/z/
}
install_vim_plug(){
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
clone_dotfiles(){
	read -p "Which repository (git@github.com:john/doe.git) do we clone ? " REPOSITORY
	read -p "And where can we clone this repository ? (/home/john/git/) " DIRECTORY
	git clone $REPOSITORY $DIRECTORY
}
# UPDATE ARCH
echo "Do you wish to update arch ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) update_arch; break;;
		No ) break;;
	esac
done
echo "Do you wish to install yay ?"
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
echo "Do you wish to install vim-plug ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) install_vim_plug; break;;
		No ) break;;
	esac
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
echo "Do you wish to install rupa/z	?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) install_z; break;;
		No ) break;;
	esac
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
echo "Do you wish to install your dotfiles repository ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) clone_dotfiles; break;;
		No ) break;;
	esac
done
