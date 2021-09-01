#!/bin/bash

# Run the base entrypoint
bash /bin/docker-entrypoint.sh

if [ ! -d $DERIVATIVES_PATH ]; then
  mkdir -p $DERIVATIVES_PATH $UPLOADS_PATH $CACHE_PATH $WORKING_PATH $SOURCE_BRANDING_PATH
  
  # Symlink the branding directory
  ln -s $SOURCE_BRANDING_PATH $APP_WORKDIR/$BRANDING_PATH
fi

# Run the initialization tasks on first run

FLAG=""
# On first deploy set the --initial flag
# This is global and persists across images
#   ie. we don't want to re-initialize on a new image
if [ ! -f $APP_WORKDIR/shared/state/.initialized ]; then
    echo "INFO: Setting the initial flag"
    FLAG="initialize"
    mkdir $APP_WORKDIR/shared/state
    touch $APP_WORKDIR/shared/state/.initialized
fi

# Solr / Fedora need to be running for initial setup only
if [ "$FLAG" == "initialize" ]; then 

  # wait for Solr and Fedora to come up
  sleep 15s
  
  # check that Solr is running
  SOLR=$(curl --silent --connect-timeout 45 "http://${SOLR_HOST:-solr}:${SOLR_PORT:-8983}/solr/" | grep "Apache SOLR")
  if [ -n "$SOLR" ] ; then
      echo "INFO: Solr is running..."
  else
      echo "ERROR: Solr is not running"
      exit 1
  fi
  
  # check that Fedora is running
  FEDORA=$(curl --silent --connect-timeout 45 "http://${FEDORA_HOST:-fcrepo}:${FEDORA_PORT:-8080}/fcrepo/" | grep "Fedora Commons Repository")
  if [ -n "$FEDORA" ] ; then
      echo "INFO: Fedora is running..."
  else
      echo "ERROR: Fedora is not running"
      exit 1
  fi
  
  echo "INFO: Create the db and run any pending migrations"
  echo "INFO: exec rails db:migrate RAILS_ENV=development"
  bundle exec rails db:migrate RAILS_ENV=development
  
  echo "INFO: Running the initialization tasks"
#   bundle exec rake assets:clean assets:precompile
  echo "INFO: exec rake hyrax:default_admin_set:create"
  bundle exec rake hyrax:default_admin_set:create
  echo "INFO: exec rake hyrax:workflow:load"
  bundle exec rake hyrax:workflow:load
  echo "INFO: exec rake hyrax:default_collection_types:create"
  bundle exec rake hyrax:default_collection_types:create
  
  echo "INFO: Add oasis-admin@york.ac.uk"
  echo "admin = Role.create(name: 'admin'); \
        User.create!(email:'oasis-admin@york.ac.uk', password:'qazwsx'); \
        admin.users << User.find_by_user_key('oasis-admin@york.ac.uk'); \
        admin.save; \
        exit" | bundle exec rails c


fi

# echo "--------- Starting Hyrax in $RAILS_ENV mode ---------"
rm $PIDS_PATH/$APPLICATION_KEY.pid
bundle exec rails server -p $RAILS_PORT -b '0.0.0.0' --pid $PIDS_PATH/$APPLICATION_KEY.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"