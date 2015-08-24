#!/bin/sh

brew cask install karabiner

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 53
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
/bin/echo
