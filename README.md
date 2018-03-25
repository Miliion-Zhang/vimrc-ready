# vimrc-ready #

## INTRODUCTION ##
This vimrc is generated using [http://vim-bootstrap.com](http://vim-bootstrap.com/) with c/ruby/lua/go/python/html/javascript enabled at 2014-11-27 by minlin.zhang

## INSTALL ##
You can run the `install.sh` under this directory to install it automatically. But some packages should be installed manually like `ctags ncurses-term flake8`, please check out the instructions on [vim-bootstrap](https://github.com/avelino/vim-bootstrap).
For coffeetags support, using `gem install CoffeeTags` to install ruby package.

#### Manually Install ####
Put vimrc / vimrc.local file into `~/.vimrc` and `~/.vimrc.local`, then execute VIM:
```
vim +NeoBundleInstall +qall
```

Updating all bundles to the latest version, run VIM:
```
:NeoBundleUpdate
```

## NOTICE ##
+ Will use default '\' as `<leader> key` rather than ',' defined by vim-bootstrap, for more infos, please visit it's [github homepage](https://github.com/avelino/vim-bootstrap)
+ Recommend VIM 7.4+ with Python & Ruby & Lua support, please check the guide in the output of `install.sh`
