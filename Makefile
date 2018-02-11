RUBY=/usr/bin/ruby 
ZSH_PATH=$(shell which zsh)
define GITCONFIG
[include]
	path = ~/dotfiles/.gitconfig
endef
export GITCONFIG

.PHONY: install homebrew_install fetch_dotfiles setup_vim setup_zsh setup_git

install: 
	$(MAKE) homebrew_install
	$(MAKE) fetch_dotfiles
	$(MAKE) setup_zsh
	$(MAKE) setup_vim
	$(MAKE) setup_git

homebrew_install:
	# homebrew install
	which brew || $(RUBY) -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# homebrew tools install
	brew install vim zsh git
fetch_dotfiles:
	# fetch_dotfiles
	[ -d ~/dotfiles ] || git clone https://github.com/ShuzoN/dotfiles.git ~/dotfiles
setup_vim:
	$(MAKE) fetch_dotfiles
	echo "source ~/dotfiles/.vimrc" > ~/.vimrc
	# install neo bundle
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh ./install.sh
	rm ./install.sh
	@echo "please exec vim & install bundles!!!"

setup_zsh:
	cat ~/.zshrc | grep "source ~/dotfiles/.zshrc" || echo "source ~/dotfiles/.zshrc" >> ~/.zshrc
	brew install hub
	test -d ~/dotfiles/zaw || git clone https://github.com/zsh-users/zaw.git ~/dotfiles/zaw
	rm -fr ~/.zcompdump
	cat /etc/shells | grep "$(ZSH_PATH)" || sudo echo "$(ZSH_PATH)" | sudo tee -a /etc/shells
	chsh -s $(ZSH_PATH)
	@echo "please reboot your shell"

setup_git:
	test -s ~/.gitconfig || echo "$$GITCONFIG" >> ~/.gitconfig
