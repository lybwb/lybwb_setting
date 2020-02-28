# lyb_setting

### Tmux 
version: 2.6

### vim
#### 下载vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#### 安装插件
运行:PluginInstall  或者在命令行运行 vim +PluginInstall +qall 


###  mac homebrew 锁住某些不更新的包
brew update 一次更新所有的包是非常方便的，但是有时候我们不想更新某些包的新版本，以免出现不兼容现象。这一需求可以使用brew pin来满足。

brew pin $FORMULA      # 锁定某个包
brew unpin $FORMULA    # 取消锁定
