#!/bin/sh

touch ~/.vimrc
echo "" >> ~/.vimrc
echo "autocmd bufnewfile *.h so ~/.vim/templates/header_h.txt" >> ~/.vimrc
echo "autocmd bufnewfile *.h exe \"0,\" . 3 . \"g/ndef/s//ndef \" .toupper(expand(\"%:r\")).expand(\"_H\")" >> ~/.vimrc
echo "autocmd bufnewfile *.h exe \"0,\" . 3 . \"g/define/s//define \" .toupper(expand(\"%:r\")).expand(\"_H\")" >> ~/.vimrc
echo "autocmd bufnewfile *.h exe \"0,\" . 5 . \"g/libft/s//libft\"" >> ~/.vimrc
echo "autocmd bufnewfile *.make so ~/.vim/templates/header_make.txt" >> ~/.vimrc

mkdir ~/.vim > /dev/null || env -i
mkdir ~/.vim/templates > /dev/null || env -i

cp -rf templates/* ~/.vim/templates/

mkdir ~/bin > /dev/null || env -i
cp create ~/bin
