if [ "$(uname -s)" == "Darwin" ]
then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
fi

exit 0
