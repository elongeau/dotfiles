DOTFILES=$(pwd)
VUNDLE_DIR="~/.vim/bundle/Vundle.vim"
THEME_DIR="~/.vim/bundle/gruvbox"

for file in $DOTFILES/*.symlink
do
	filename=$(basename $file)
	filename=".${filename%.*}"
	echo "Création du lien symbolique $filename pour : $file"
	if [ -e ~/$filename ];then
		rm -rf ~/$filename
	fi

  if type fromdos &> /dev/null; then
    fromdos $file
  fi

	ln -s $file ~/$filename
done

if [[ -z $VUNDLE_DIR ]]; then
  # install Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

if [[ -z $VUNDLE_DIR ]]; then
  # install gruvbox theme
  git clone https://github.com/morhetz/gruvbox.git $THEME_DIR
fi

echo "You need to run : \nsudo fromdos ~/.vim/bundle/**/*; vim +PluginInstall +qall; sudo fromdos ~/.vim/bundle/**/*"
