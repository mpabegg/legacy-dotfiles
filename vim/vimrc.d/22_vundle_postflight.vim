" Vundle postflight stuff, install automatically if not available

if isVundleFirstInstall == 1
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

unlet isVundleFirstInstall

filetype plugin indent on
