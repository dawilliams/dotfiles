sync:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/alacritty

	[ -f ~/.bash_profile ] || ln -s $(PWD)/bash_profile ~/.bash_profile
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

clean:
	rm -f ~/.bash_profile
	rm -f ~/.bashrc
	rm -f ~/.gitconfig
	rm -f ~/.config/alacritty/alacritty.yml
