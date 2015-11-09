if [ "$(uname -s)" == "Darwin" ]
then
  if test ! $(which brew)
  then
    echo "  Installing Homebrew for you."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew install caskroom/cask/brew-cask
fi
exit 0
