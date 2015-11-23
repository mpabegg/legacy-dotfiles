if [ "$(uname -s)" == "Darwin" ]
then
  brew cask install spectacle
fi

defaults read com.divisiblebyzero.Spectacle.plist

exit 0
