ln -s ~/mycode/workspace/conf/.bash_profile ~/.bash_profile

mkdir -p ~/.vim/tmp/backup
ln -s ~/mycode/workspace/conf/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git config --global alias.st status

ln -s ~/mycode/workspace/conf/.tmux.conf ~/.tmux.conf
