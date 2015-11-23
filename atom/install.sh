if test ! $(which apm) || [ "$(uname -s)" == "Darwin" ]
then
  brew cask install atom
fi

apm install --packages-file package-list

yes yes | apm upgrade

exit 0
