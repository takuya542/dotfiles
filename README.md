## 概要
- dotfilesを一括提供するレポジトリ
- initスクリプトを実行する事で以下を実現可能
  - vim7.3のインストール
  - dotfilesのシンボリックリンクを設定
- Vundle.vimはサブモジュールとして管理しているので、clone時は空なので注意

## 使い方

```
cd
git clone git@github.com:takuya542/dotfiles.git

# vimのインストール
~/dotfiles/initialize_vim.sh

# シンボリックリンク
~/dotfiles/initialize_symlink.sh --create [ --destroy]

# サブモジュール(Vundle.vim)の初期化
cd ~/dotfiles
git submodule status
git submodule init
git submodule update

# BundleInstall
vimrc
:BundleInstall でプラグインインストール

# vimprocのビルド(silver searchに必要)
cd ~/.vim/bundle/vimproc
make

# plenvの設定
~/dotfiles/initialize_plenv.sh

```
