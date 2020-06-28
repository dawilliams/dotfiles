sync:
	mkdir -p ~/.aws
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/kitty
	mkdir -p ~/.kube

	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.bash_completion ] || ln -s $(PWD)/bash_completion ~/.bash_completion
	[ -f ~/.bash_profile ] || ln -s $(PWD)/bash_profile ~/.bash_profile
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -s $(PWD)/gitignore_global ~/.gitignore_global
	[ -f ~/.config/kitty/kitty.conf ] || ln -s $(PWD)/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/config/nvim/init.vim ~/.config/nvim/init.vim
	[ -f ~/.config/nvim/coc-settings.json ] || ln -s $(PWD)/config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-iterm2

	pip3 install --upgrade howdoi
	pip3 install --upgrade neovim-remote 

clean:
	rm -f ~/.aliases
	rm -f ~/.bash_completion
	rm -f ~/.bash_profile
	rm -f ~/.bashrc
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -rf ~/.config/base16-shell
	rm -rf ~/.config/base16-iterm2
	rm -f ~/.config/kitty/kitty.conf
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/nvim/coc-settings.json
