#!/bin/bash

set -e
rm -rf ~/.vim*
rm -rf ~/.gvim*

# ----
# YAVC
# ----
git clone git@github.com:shwsun/yavc.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc &&  vim -u NONE -e -c "mkspell! $HOME/.vim/spell/en.utf-8.add" -c q
echo ""
echo "rm ~/.vim/plugged/c-support/c-support/templates/Templates && cp ~/.vim/plugin/Templates ~/.vim/plugged/c-support/c-support/templates"
echo ""


# phonix
#git clone https://github.com/phoenixlzx/dotvim.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc

# good
#rm -rf ~/.gvim* && rm -rf ~/dotfiles && git clone https://github.com/NLKNguyen/dotfiles ~/dotfiles && ln -s ~/dotfiles/vimrc ~/.vimrc && ln -s ~/dotfiles/gvimrc ~/.gvimrc && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall

# zenhack
#git clone git://github.com/zenhack/vim-config ~/.vim && cd ~/.vim && ./setup.sh

# spf-13
#sh <(curl https://j.mp/spf13-vim3 -L)

# cacay
# huge problem: will keep creating ~
#git clone https://github.com/cacay/vimrc.git  ~/.vim_runtime  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim_runtime/plugin/Vundle.vim && echo "source ~/.vim_runtime/vimrc/main.vim" >> ~/.vimrc && vim +PluginInstall +qall && cd /home/jethros/.vim_runtime/plugin/YouCompleteMe ; ./install.py --clang-completer --go-completer --rust-completer

# -----------------------
# Jess fraz
# -----------------------
#git clone --recursive https://github.com/jessfraz/.vim.git ~/.vim && ln -sf $HOME/.vim/vimrc $HOME/.vimrc && cd $HOME/.vim && git submodule update --init




#----------------------------------------------------------------------------------------------------------------------

# git clone http://github.com/mutewinter/dot_vim.git ~/.config/nvim

# ongardie
#git clone https://ongardie.net/vim.git/ .vim &&  ln -s .vim/vimrc .vimrc

# Golang
#git clone git://github.com/cridenour/vimrc.git ~/.vim_runtime
#sh ~/.vim_runtime/install_awesome_vimrc.sh

# SpaceVim
#curl -sLf https://spacevim.org/install.sh | bash

# janus
#curl -L https://bit.ly/janus-bootstrap | bash


# -----------------------
# dot vim
# -----------------------
#git clone http://github.com/mutewinter/dot_vim.git ~/.vim && rm ~/.vim/plug_plugins/editorconfig-vim.vim  && ln -s ~/.vim/init.vim ~/.vimrc

#lc525
#https://github.com/lc525/vimcfg.git

# -----------------------
# python vimrc
# ----------------------
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ets-labs/python-vimrc/master/setup.sh)"

# --------------
# vim-notetaking
# --------------
#git clone git@github.com:shwsun/vim-notetaking.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc && ln -s ~/.vim/vimpcrc ~/.vimpcrc

# ------------------
# ultimate vim
# ------------------
#git clone https://github.com/amix/vimrc.git ~/.vim_runtime
#sh ~/.vim_runtime/install_awesome_vimrc.sh

# ---------
# oh-my-vim
# ---------
#rm -rf ~/.oh-my-vim && curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh

# --------
# vim-ruby
# --------
#git clone https://github.com/janko-m/dotfiles.git && cp -r ~/dotfiles/.vim ~/.vim && cp ~/dotfiles/.vimrc ~/.vimrc && rm -rf ~/dotfiles


# https://github.com/JBakamovic/yavide/blob/master/docs/INSTALL.md

# end of vide.sh
