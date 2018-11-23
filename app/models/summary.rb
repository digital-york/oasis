# Generated via
#  `rails generate hyrax:work Summary`
class Summary < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  has_many :downloaders, dependent: :destroy, class_name: 'Downloader', :autosave => true

  self.indexer = SummaryIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []

  self.human_readable_type = 'Summary'
  # validates :summary_writer,                 presence:     { message: 'Your summary must have a writer.' }
  # validates :title_of_summary,               presence:     { message: 'Your summary must have a title.' }
  # validates :publication_author,             presence:     { message: 'Your summary must have an author.' }
  # validates :summary_general_research_area, presence:     { message: 'Your summary must have a general research area.' }
  # validates :publication_identifier, presence:            { message: 'Your summary must have a publication identifier.' }
  # validates :publication_title, presence:                  { message: 'Your summary must have a publication title.' }
  # validates :publication_date, presence:                   { message: 'Your summary must have a publication year.' }
  # validates :publication_journal_name, presence:          { message: 'Your summary must have a journal name.' }
  # validates :publication_volume, presence:                 { message: 'Your summary must have a publication volume.' }
  # validates :publication_issue, presence:                  { message: 'Your summary must have an issue number.' }
  # validates :participants_type, presence:                  { message: 'Your summary must have a participants type.' }

  include ::Oasis::OasisMetadata

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
