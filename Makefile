sync:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/kitty

	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.config/kitty/kitty.conf ] || ln -s $(PWD)/config/kitty/kitty.conf ~/.config/kitty/kitty.conf

clean:
	rm -f ~/.bashrc
	rm -f ~/.gitconfig
	rm -f ~/.config/kitty/kitty.conf
