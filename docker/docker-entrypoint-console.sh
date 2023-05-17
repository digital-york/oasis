#!/bin/bash

# Run the base entrypoint
bash /bin/docker-entrypoint.sh

echo "--------- Starting Rails Console in $RAILS_ENV mode ---------"
RUBYOPT="-W0 -W:no-deprecated -W:no-experimental" bundle exec rails console
