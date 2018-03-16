# expected by this Rails application.
#
# The applicatino's ENV variables first come from the ENV of the shell profile,
# then any missing ENV variables are injected via the config/application.yml
# file.
#
# See https://github.com/laserlemon/figaro for further details on usage

# Please keep these alphabetized!
Figaro.require_keys(
  'fedora_base_path',
  'fedora_url',
  'solr_url'
)
