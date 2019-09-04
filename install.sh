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
clone_dotfile(){
	read -p "Directory path ? : " DIRECTORY
	git clone git@github.com:blb78/dotfile.git ~/dev/
}
create_symlink(){
	cd ~/dev/dotfile/
	rm ~/.config/alacritty/alacritty.yml
	ln ~/dev/dotfile/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	rm ~/.config/betterlockscreenrc
	ln ~/dev/dotfile/betterlockscreen/betterlockscreenrc ~/.config/betterlockscreenrc
	rm ~/.config/i3/config
	ln ~/dev/dotfile/i3/config ~/.config/i3/config
	rm ~/.config/nvim/init.vim
	ln ~/dev/dotfile/nvim/init.vim ~/.config/nvim/init.vim
	cp -R ~/dev/dotfile/rofi	~/.config/rofi
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
# Create symlink
echo "Do you wish to create symlink for your apps ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) create_symlink; break;;
		No ) break;;
	esac
done

