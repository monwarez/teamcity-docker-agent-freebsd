#!/usr/local/bin/bash
#generate ~/.bash_profile with forwarded env vars from docker container
if [ -e /provisioned ]
then
  /usr/local/bin/bash $HOME/env
  /usr/local/bin/bash $HOME/tc.sh
fi

