DOTFILES=$(pwd)
cd ~
HOME=$(pwd)

for file in $DOTFILES/*.symlink
do
	filename=$(basename $file)
	filename=".${filename%.*}"
	echo "Création du lien symbolique $filename pour : $file"
	if [ -e $filename ];then
		rm -rf $HOME/$filename
	fi

	fromdos $file
	ln -s $file $HOME/$filename
done

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install gruvbox theme
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

echo "You need to run : \nsudo fromdos ~/.vim/bundle/**/*; vim +PluginInstall +qall; sudo fromdos ~/.vim/bundle/**/*"
