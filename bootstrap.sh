DOTFILES=$(pwd)
cd ~
HOME=$(pwd)

for file in $DOTFILES/*.symlink
do
	filename=$(basename $file)
	filename=".${filename%.*}"
  echo "Création du lien symbolique $filename pour : $file"
  if [ -e $filename  ] 
  then
    rm -rf $HOME/$filename
  fi

	ln -s $file $HOME/$filename
done
