create_symlink(){
	cd ~/dev/dotfile/
	# ALACRITTY
	rm ~/.config/alacritty/alacritty.yml
	ln ~/dev/dotfile/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	# BETTERLOCKSCREEN
	rm ~/.config/betterlockscreenrc
	ln ~/dev/dotfile/betterlockscreen/betterlockscreenrc ~/.config/betterlockscreenrc
	# I3
	rm ~/.config/i3/config
	ln ~/dev/dotfile/i3/config ~/.config/i3/config
	# NVIM
	rm ~/.config/nvim/init.vim
	ln ~/dev/dotfile/nvim/init.vim ~/.config/nvim/init.vim
	# ROFI
	rm -rf ~/.config/rofi
	cp -R ~/dev/dotfile/rofi ~/.config/rofi
	# ZSH
	rm ~/.zshrc
	ln ~/dev/dotfile/zsh/.zshrc ~/
	# TMUX
	rm ~/.tmux.conf
	ln ~/dev/dotfile/tmux/.tmux.conf ~/
}
# Create symlink
echo "Do you wish to create symlink for your apps ?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) create_symlink; break;;
		No ) break;;
	esac
done

