#!/usr/bin/env bash

# skkdic-extra → 日本語の追加登録
sudo apt install skkdic-extra

package_list="helm jedi tern tern-auto-complete emmet-mode prettier-js undo-tree lua-mode codic rjsx-mode flycheck irony meghanada tide clang-format visual-regexp-steroids"

emacsclient -e "(package-refresh-contents)"

for pkg in $package_list;do
    emacsclient -e "(package-install '$pkg)"
done

for dotfile in $(ls dotfiles | grep set | sed -nr "s/set-(.*)/\1/p");do
    cp $dotfile $HOME/
done

# sudo cp el-files/* /usr/share/emacs/27.1/site-lisp/	       
sudo cp el-files/* /usr/local/share/emacs/29.0.50/site-lisp/
