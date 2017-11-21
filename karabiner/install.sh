if [ "$(uname -s)" == "Darwin" ]
then
  brew cask install karabiner-elements
fi

cp "$(pwd)/karabiner/config/karabiner/" ~/.config

exit 0
