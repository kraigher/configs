set -ex
ln -sf `readlink -e gitconfig` $HOME/.gitconfig
ln -sf `readlink -e emacs.el` $HOME/.emacs.el
