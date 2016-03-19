## Initialize

```
git clone git@github.com:takuya542/dotfiles.git
cd ~/dotfiles
bash ~/init_linux.sh

vi ~/.vimrc
:BundleInstall
cd ~/.vim/bundle/vimproc
make
```

## keybind
- defined in .zsh_main
```
Ctr + @ : 最近移動したディレクトリ一覧.選択したdirに移動
Ctr + ] : screen一覧.選択したscreenにアタッチ
Ctr + r : history一覧.選択したコマンドをコマンドラインに挿入(実行はしない)
Ctr + b : ブランチ一覧.選択したブランチにcheckout

Ctr + x + b : プロセス一覧:選択したプロセスをkill
```

## functions
```
pvim  [args] : 引数で渡した文字列を含むファイル一覧表示.選択したファイルをvimで開く
pless [args] : 引数で渡した文字列を含むファイル一覧表示.選択したファイルをlessで開く
```
