#!/bin/bash

# =====================================================================
# vim7.3をインストールする為のスクリプト( neobundleによるプラグイン管理に必要)
# =====================================================================

cd $HOME/

sudo yum -y install mercurial
sudo yum -y install ncurses-devel

wget http://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxfv vim-7.3.tar.bz2

mkdir vim73/patches
cd vim73/patches
seq -f http://ftp.vim.org/pub/vim/patches/7.3/7.3.%03g 3 | xargs wget

cd ..cat patches/7.3.* | patch -p0

cd ~/vim73 

./configure --prefix=/usr --enable-multibyte --with-features=huge --disable-selinux

sudo make

sudo make install

rm ~/vim-7.3.tar.bz2
