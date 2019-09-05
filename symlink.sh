create_symlink(){
	cd ~/dev/dotfile/
	if [ -f "~/.config/alacritty/alacritty.yml" ];then
		rm ~/.config/alacritty/alacritty.yml
	fi
	ln ~/dev/dotfile/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	if [ -f "~/.config/betterlockscreenrc" ];then
		rm ~/.config/betterlockscreenrc
	fi
	ln ~/dev/dotfile/betterlockscreen/betterlockscreenrc ~/.config/betterlockscreenrc
	if [ -f "~/.config/i3/config" ];then
		rm ~/.config/i3/config
	fi
	ln ~/dev/dotfile/i3/config ~/.config/i3/config
	if [ -f "~/.config/nvim/init.vim" ];then
		rm ~/.config/nvim/init.vim
	fi
	ln ~/dev/dotfile/nvim/init.vim ~/.config/nvim/init.vim
	if [ -d "~/.config/rofi" ];then
		rm ~/.config/rofi
	fi
	cp -R ~/dev/dotfile/rofi ~/.config/rofi
	if [ -f "~/.config/.zshrc" ];then
		rm ~/.config/.zshrc
	fi
	ln ~/dev/dotfile/zsh/.zshrc ~/.config
}
# Create symlink
echo "Do you wish to create symlink for your apps ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) create_symlink; break;;
		No ) break;;
	esac
done

