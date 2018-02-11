RUBY=/usr/bin/ruby 
ZSH_PATH=$(shell which zsh)
define GITCONFIG
[include]
	path = ~/dotfiles/.gitconfig
endef
export GITCONFIG

.PHONY: install homebrew_install fetch_dotfiles setup_vim setup_zsh setup_git setup_ssh

install: 
	$(MAKE) homebrew_install
	[ -s ~/.ssh/id_rsa.pub ] || $(MAKE) setup_ssh
	$(MAKE) setup_git
	$(MAKE) fetch_dotfiles
	$(MAKE) setup_zsh
	$(MAKE) setup_vim

homebrew_install:
	# homebrew install
	which brew || $(RUBY) -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# homebrew tools install
	brew install vim zsh git

fetch_dotfiles:
	# fetch_dotfiles
	[ -d ~/dotfiles ] || git clone git@github.com:ShuzoN/dotfiles.git

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
	cat /etc/shells | grep "$(ZSH_PATH)" || (sudo echo "$(ZSH_PATH)" | sudo tee -a /etc/shells;  chsh -s $(ZSH_PATH))
	@echo "please reboot your shell"

setup_git:
	xcode-select --install
	test -s ~/.gitconfig || echo "$$GITCONFIG" >> ~/.gitconfig

setup_ssh:
	[ -s ~/.ssh/id_rsa.pub ] || ssh-keygen
	cat ~/.ssh/id_rsa.pub
	@echo "\n please register ssh key to your github account: https://github.com/settings/keys"
	@echo " and you setup ssh-key, exec 'make install' again"
