#!/bin/bash

# Run the base entrypoint
bash /bin/docker-entrypoint.sh

echo "--------- Starting Sidekiq in $RAILS_ENV mode ---------"
bundle exec sidekiq
