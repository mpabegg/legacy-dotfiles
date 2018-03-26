if [ "$(uname -s)" == "Darwin" ]
then
  brew cask install karabiner-elements
fi

cp -R "$(pwd)/karabiner/config/karabiner/" ~/.config

exit 0
case
