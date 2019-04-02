sync:
	mkdir -p ~/.aws
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.kube

	[ -f ~/.bash_profile ] || ln -s $(PWD)/bash_profile ~/.bash_profile
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/config/nvim/init.vim ~/.config/nvim/init.vim

	pip3 install --upgrade neovim-remote 

clean:
	rm -f ~/.bash_profile
	rm -f ~/.bashrc
	rm -f ~/.gitconfig
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/nvim/init.vim
