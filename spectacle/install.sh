if [ "$(uname -s)" == "Darwin" ]
then
  brew cask install spectacle
fi

defaults import com.divisiblebyzero.Spectacle ./spectacle/com.divisiblebyzero.Spectacle.plist

exit 0
