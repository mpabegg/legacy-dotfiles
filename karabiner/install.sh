if [ "$(uname -s)" == "Darwin" ]
then
  brew cask install karabiner-elements
fi

ln -s "$(pwd)/karabiner/config/karabiner/" ~/.config

exit 0
