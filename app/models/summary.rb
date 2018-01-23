# Generated via
#  `rails generate hyrax:work Summary`
class Summary < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = SummaryIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []

  self.human_readable_type = 'Summary'
  validates :summary_creator,                presence:     { message: 'Your summary must have a creator.' }
  validates :summary_type,                    presence:    { message: 'Your summary must have a type.' }
  validates :summary_general_research_area, presence:    { message: 'Your summary must have a general research area.' }

  include ::Oasis::OasisMetadata

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end
