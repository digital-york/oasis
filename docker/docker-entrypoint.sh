#!/bin/bash

echo "Running the base entrypoint"

echo "Creating pids folders"
mkdir -p $PIDS_PATH

if [[ "$RAILS_ENV" == "production" ]]; then
    echo 'RAILS_ENV is production, running bundle check'
    # Verify all the production gems are installed
    bundle check
else
    echo 'RAILS_ENV is not production, installing dev and test dependencies'
    bundle check || bundle install --without production
fi

# bundle exec rake leaf_addons:db:setup_and_migrate

# echo "Checking for new assets ... "

# if [[ -d $APP_WORKDIR/public/assets && -f $APP_WORKDIR/shared/assets_hash ]]; then
#   find public/assets -type f | sort | xargs md5sum | cut -c1-32 | md5sum | cut -c1-32 > $APP_WORKDIR/assets_hash
#   echo $(cat $APP_WORKDIR/assets_hash)
#   echo $(cat $APP_WORKDIR/shared/assets_hash)
#   if [[ "$(cat $APP_WORKDIR/assets_hash)" != "$(cat $APP_WORKDIR/shared/assets_hash)" ]]; then
#     echo "Running rake assets:precompile to update assets... "
#     bundle exec rake assets:precompile
#     mv assets_hash $APP_WORKDIR/shared/
#   else
#     echo "No changes to assets ..."
#     rm $APP_WORKDIR/assets_hash
#   fi
# else
#   echo "Running rake assets:precompile ... "
#   bundle exec rake assets:precompile
#   find public/assets -type f | sort | xargs md5sum | cut -c1-32 | md5sum | cut -c1-32 > $APP_WORKDIR/shared/assets_hash
# fi