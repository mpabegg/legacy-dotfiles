if test ! $(which apm)
  brew cask install atom
fi

apm install --packages-file package-list

exit 0
