# Run this script to copy this configuration to the current host
# This can be undone with the other script "restore_config.sh"
DIR="$(cd "$(dirname "$0")" && pwd)"

# Check if there exist a current configuration file and make a backup
test -e "${HOME}/.bashrc" && mv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
test -e "${HOME}/.zshrc" && mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
test -e "${HOME}/.tmux.conf" && mv "${HOME}/.tmux.conf" "${HOME}/.tmux.conf.bak"
test -e "${HOME}/.vimrc" && mv "${HOME}/.vimrc" "${HOME}/.vimrc.bak"
test -d "${HOME}/.vim" && mv "${HOME}/.vim" "${HOME}/.vim.bak"

ln -s "${DIR}/bashrc/dot-bashrc" "${HOME}/.bashrc"
ln -s "${DIR}/tmux/dot-tmux.conf" "${HOME}/.tmux.conf"
ln -s "${DIR}/vim/dot-vimrc" "${HOME}/.vimrc"
ln -s "${DIR}/vim/dot-vim" "${HOME}/.vim"
ln -s "${DIR}/zshrc/dot-zshrc" "${HOME}/.zshrc"
