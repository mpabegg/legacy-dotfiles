if [ "$(uname -s)" == "Darwin" ]
then
  brew cask install iterm2
fi

defaults import ~/.iterm2prefs/com.googlecode.iterm2.plist

exit 0
