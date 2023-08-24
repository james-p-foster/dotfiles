#!/usr/bin/env bash

# Going back in the directory tree
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Named locations
alias d='cd ~/Documents'
alias dl='cd ~/Downloads'
alias db='cd ~/Dropbox'

# ROS sourcing
alias sd='source devel/setup.bash && echo "Sourced devel"'
alias si='source install/setup.bash && echo "Sourced install"'
alias sdl='source devel/local_setup.bash && echo "Sourced devel local"'
alias sil='source install/local_setup.bash && echo "Sourced install local"'