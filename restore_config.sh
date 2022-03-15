# Run this script to undo the changes made by copy_config.sh

test -L "${HOME}/.bashrc" && rm "${HOME}/.bashrc"
test -e "${HOME}/.bashrc.bak" && mv "${HOME}/.bashrc.bak" "${HOME}/.bashrc"

test -L "${HOME}/.zshrc" && rm "${HOME}/.zshrc"
test -e "${HOME}/.zshrc.bak" && mv "${HOME}/.zshrc.bak" "${HOME}/.zshrc"

test -L "${HOME}/.tmux.conf" && rm "${HOME}/.tmux.conf"
test -e "${HOME}/.tmux.conf.bak" && mv "${HOME}/.tmux.conf.bak" "${HOME}/.tmux.conf"

test -L "${HOME}/.vimrc" && rm "${HOME}/.vimrc"
test -e "${HOME}/.vimrc.bak" && mv "${HOME}/.vimrc.bak" "${HOME}/.vimrc"

test -L "${HOME}/.vim" && rm "${HOME}/.vim"
test -d "${HOME}/.vim.bak" && mv "${HOME}/.vim.bak" "${HOME}/.vim"

