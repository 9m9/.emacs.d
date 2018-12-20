#!/usr/bin/env bash

go get -u github.com/nsf/gocode
gocode set propose-builtins true
gocode set lib-path "~/go/src"
mkdir -p ~/.emacs.d/packages/gocode
cd ~/.emacs.d/packages/gocode
ln -s ~/go/src/github.com/nsf/gocode/emacs/go-autocomplete.el go-autocomplete.el
