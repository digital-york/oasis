# Generated via
#  `rails generate hyrax:work Downloader`
class Downloader < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  belongs_to :summary, predicate: ::RDF::URI.new('https://oasis-database.org/ontologies/oasis#downloader')

  self.indexer = DownloaderIndexer

  self.human_readable_type = 'Downloader'

  include ::Oasis::DownloaderMetadata

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
