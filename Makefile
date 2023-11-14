# todo: Hacer uninstall de copy e install
CURRENT_TOOLS := bash zsh tmux vim


define copy_config_to_from
	@if [ -e $(1) ]; then \
		mv $(1) $(1).bak; \
		echo "Created $(1) backup"; \
	fi
	@if [ -f $(2) ]; then \
		install -vDm640 $(2) $(1); \
	elif [ -d $(2) ]; then \
		echo "$(1) copied"; \
		cp -r $(2) $(1); \
	fi
endef


define substitute_config_to_from
  @if [ -e $(1) ]; then \
		echo "Deleting $(1)"; \
		rm -rf $(1); \
  fi
	@if [ -f $(2) ]; then \
		install -vDm640 $(2) $(1); \
	elif [ -d $(2) ]; then \
		echo "$(1) copied"; \
		cp -r $(2) $(1); \
	fi
endef


define install_config_to_from
  @if [ -e $(1) ]; then \
		mv $(1) $(1).bak; \
		echo "Created $(1) backup"; \
  fi
	@ln -s $(2) $(1)
endef


default: help

help:
	@echo 'TERMINOLOGY'
	@echo '  - Install: Create a backup of current dotfile and create a symlink to a dotfile from this repository'
	@echo '  - Copy: Create a backup of current dotfile and copy a dotfile from this repository'
	@echo '  - Substitute: Delete current dotfile and copy a dotfile from this repository'
	@echo ''
	@echo 'COMMANDS'
	@echo 'make:                 Show this message'
	@echo 'make install:         Install all available dotfiles'
	@echo 'make substitute:      Substitute all available dotfiles. WARNING: THIS WILL DELETE CURRENT DOTFILES'
	@echo 'make copy:            Copy all available dotfiles.'
	@echo 'make foo_install:     Install only a specific dotifile e.g. "bash_install"'
	@echo 'make foo_substitute:  Substitute only a specific dotifile e.g. "bash_substitute"'
	@echo 'make foo_copy:        Copy only a specific dotifile e.g. "bash_copy"'
	@echo 'make list:            List available dotfiles in this repository'


list:
	@echo "Current tools/shells are:"
	@for tool in $(CURRENT_TOOLS); do \
		echo "- $$tool"; \
	done


install: bash_install zshrc_install tmux_install vim_install
substitute: bash_substitute zsh_substitute tmux_substitute vim_substitute
copy: bash_copy zsh_copy tmux_copy vim_copy
uninstall: restore_install


bash_install:
	$(call install_config_to_from, "${HOME}/.bashrc", "$(CURDIR)/bashrc/dot-bashrc")
	
zshrc_install:
	$(call install_config_to_from, "${HOME}/.zshrc", "$(CURDIR)/zshrc/dot-zshrc")

tmux_install:
	$(call install_config_to_from, "${HOME}/.tmux.conf", "$(CURDIR)/tmux/dot-tmux.conf")

vim_install:
	$(call install_config_to_from, "${HOME}/.vim", "$(CURDIR)/vim/dot-vim")
	$(call install_config_to_from, "${HOME}/.vimrc", "$(CURDIR)/vim/dot-vimrc")


bash_substitute:
	$(call substitute_config_to_from, "${HOME}/.bashrc", bashrc/dot-bashrc)

zsh_substitute:
	$(call substitute_config_to_from, "${HOME}/.zshrc", zshrc/dot-zshrc)

tmux_substitute:
	$(call substitute_config_to_from, "${HOME}/.tmux.conf", tmux/dot-tmux.conf)

vim_substitute:
	$(call substitute_config_to_from, "${HOME}/.vim", "vim/dot-vim")
	$(call substitute_config_to_from, "${HOME}/.vimrc", "vim/dot-vimrc")


bash_copy:
	$(call copy_config_to_from, "${HOME}/.bashrc", bashrc/dot-bashrc)

zsh_copy:
	$(call copy_config_to_from, "${HOME}/.zshrc", zshrc/dot-zshrc)

tmux_copy:
	$(call copy_config_to_from, "${HOME}/.tmux.conf", tmux/dot-tmux.conf)

vim_copy:
	$(call copy_config_to_from, "${HOME}/.vim", "vim/dot-vim")
	$(call copy_config_to_from, "${HOME}/.vimrc", "vim/dot-vimrc")
	

restore_install:
	@test -L "${HOME}/.bashrc" && rm "${HOME}/.bashrc"
	@test -e "${HOME}/.bashrc.bak" && mv "${HOME}/.bashrc.bak" "${HOME}/.bashrc"
	@test -L "${HOME}/.zshrc" && rm "${HOME}/.zshrc"
	@test -e "${HOME}/.zshrc.bak" && mv "${HOME}/.zshrc.bak" "${HOME}/.zshrc"
	@test -L "${HOME}/.tmux.conf" && rm "${HOME}/.tmux.conf"
	@test -e "${HOME}/.tmux.conf.bak" && mv "${HOME}/.tmux.conf.bak" "${HOME}/.tmux.conf"
	@test -L "${HOME}/.vimrc" && rm "${HOME}/.vimrc"
	@test -e "${HOME}/.vimrc.bak" && mv "${HOME}/.vimrc.bak" "${HOME}/.vimrc"
	@test -L "${HOME}/.vim" && rm "${HOME}/.vim"
	@test -d "${HOME}/.vim.bak" && mv "${HOME}/.vim.bak" "${HOME}/.vim"


.PHONY: default help list install substitute copy uninstall \
				bash_install zshrc_install tmux_install vim_install \
				bash_substitute zshrc_substitute tmux_substitute vim_substitute \
				bash_copy zshrc_copy tmux_copy vim_copy
