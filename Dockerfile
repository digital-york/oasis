# Use an multi-stage build to setup ssh
#   copy the key and config to enable git clone
#   @todo Docker 18.9 provides an improved mechanism: https://docs.docker.com/develop/develop-images/build_enhancements/#using-ssh-to-access-private-data-in-builds
FROM ruby:2.7.2 as intermediate

RUN apt-get update
RUN apt-get install -y git

ARG SSH_PRIVATE_KEY=
ARG APP_WORKDIR

RUN mkdir /root/.ssh/

ADD docker/ssh_config /root/.ssh/config
RUN chmod 400 /root/.ssh/config 

ADD ${SSH_PRIVATE_KEY} /root/.ssh/id_rsa

# copy and bundle ncelp app
RUN mkdir $APP_WORKDIR
WORKDIR $APP_WORKDIR

FROM ruby:2.7.2

# Setup build variables
ARG APP_WORKDIR
ARG RAILS_ENV
ARG DERIVATIVES_PATH
ARG BRANDING_PATH
ARG UPLOADS_PATH
ARG CACHE_PATH
ARG WORKING_PATH
ARG FITS_VERSION

# Install libraries, dependencies and java
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
    libpq-dev \
    libxml2-dev libxslt1-dev \
    nodejs \
    imagemagick \
    libreoffice \
    ghostscript \
    ffmpeg \
    ufraw \
    bzip2 unzip xz-utils \
    git \
    vim \
    default-jre-headless \
    clamav \
    libclamav9 \
    libclamav-dev

# Install fits
RUN mkdir -p /fits/ \
    && wget -q http://projects.iq.harvard.edu/files/fits/files/$FITS_VERSION.zip -O /fits/$FITS_VERSION.zip \
    && unzip -q /fits/$FITS_VERSION.zip -d /fits \
    && chmod a+x /fits/$FITS_VERSION/fits.sh \
    && rm /fits/$FITS_VERSION.zip

# Create folders to store hyrax derivatives, uploads, cache and working directory
RUN mkdir -p $DERIVATIVES_PATH
RUN mkdir -p $UPLOADS_PATH
RUN mkdir -p $CACHE_PATH
RUN mkdir -p $WORKING_PATH
RUN mkdir -p $BRANDING_PATH

# Copy from intermdiate
COPY --from=intermediate $APP_WORKDIR $APP_WORKDIR

# Create shared directory - required by docker
RUN mkdir -p $APP_WORKDIR/shared/state

# Add the entrypoint files
COPY docker/docker-entrypoint.sh /bin/
RUN chmod +x /bin/docker-entrypoint.sh

COPY docker/docker-entrypoint-web.sh /bin/
RUN chmod +x /bin/docker-entrypoint-web.sh

COPY docker/docker-entrypoint-worker.sh /bin/
RUN chmod +x /bin/docker-entrypoint-worker.sh

COPY docker/docker-entrypoint-console.sh /bin/
RUN chmod +x /bin/docker-entrypoint-console.sh

# Install gems
WORKDIR $APP_WORKDIR
COPY Gemfile /${APP_WORKDIR}/Gemfile
COPY Gemfile.lock /${APP_WORKDIR}/Gemfile.lock
RUN gem update --system; gem install bundler
RUN if [ "$RAILS_ENV" = "production" ]; then bundle install --without development test; else bundle install; fi
# Install app for production deployment 
# Do not rebuild for local development as docker-compose use local mount to $APP_WORDKIR
COPY . $APP_WORKDIR
