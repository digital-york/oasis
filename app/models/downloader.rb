# Generated via
#  `rails generate hyrax:work Downloader`
class Downloader < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = DownloaderIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  self.human_readable_type = 'Downloader'

  include ::Oasis::DownloaderMetadata

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
