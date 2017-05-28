#!/bin/bash

CMD="$*"

if [ $# -eq 0 ]; then
    echo "Welcome to Ubuntu Powernap edition."
    echo "  - Ubuntu version $(lsb_release -a 2> /dev/null | grep -i Release | awk '{print $2}')"
    zsh
else
    zsh -c "$CMD"
fi

