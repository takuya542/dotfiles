sudo yum -y install zsh
sudo rpm -lvi http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.14-1.el6.x86_64.rpm
USER=`whoami`
sudo usermod -s /bin/zsh $USER

# 既存aliasを削除
for alias in `find $HOME -type l  -maxdepth 1`; do 
    echo "rm ${alias}"
    rm ${alias}
done

for file in `find $HOME/dotfiles -maxdepth 1 -name ".*" | sed 's!^.*/!!' | grep -v '.git$'`; do
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
