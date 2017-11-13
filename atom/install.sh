if test ! $(which apm) || [ "$(uname -s)" == "Darwin" ]
then
  brew cask install atom
fi

apm install proton-mode

exit 0
