#!/bin/bash

stow bash        -t ~
stow fish        -t ~
stow bin         -t ~
stow mac         -t ~
stow -t ~   spacemacs

cd config
stow -t ~/.config  .config


