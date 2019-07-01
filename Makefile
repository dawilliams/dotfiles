sync:
	mkdir -p ~/.aws
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/kitty
	mkdir -p ~/.kube

	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.bash_profile ] || ln -s $(PWD)/bash_profile ~/.bash_profile
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.config/kitty/kitty.conf ] || ln -s $(PWD)/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/config/nvim/init.vim ~/.config/nvim/init.vim
	[ -f ~/.config/nvim/coc-settings.json ] || ln -s $(PWD)/config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	pip3 install --upgrade howdoi
	pip3 install --upgrade neovim-remote 

clean:
	rm -f ~/.aliases
	rm -f ~/.bash_profile
	rm -f ~/.bashrc
	rm -f ~/.gitconfig
	rm -f ~/.config/kitty/kitty.conf
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/nvim/coc-settings.json
