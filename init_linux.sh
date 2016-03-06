sudo yum -y install zsh the_silver_searcher
USER=`whoami`
sudo usermod -s /bin/zsh $USER

# 既存aliasを削除
for alias in `find $HOME -type l  -maxdepth 1`; do 
    echo "rm ${alias}"
    rm ${alias}
done

for file in `find $HOME/dotfiles -name ".*" -maxdepth 1 | sed 's!^.*/!!' | grep -v .git`; do
    echo "ln -s -f $HOME/dotfiles/${file} $HOME/${file}"
    ln -s -f $HOME/dotfiles/${file} $HOME/${file}
done

# vim7.3インストール
~/dotfiles/init_vim.sh

# サブモジュールをインストール
cd ~/dotfiles
git submodule status
git submodule init
git submodule update

# ログインシェル再起動
exec $SHELL -l
source ~/.zshrc
