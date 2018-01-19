# Generated via
#  `rails generate hyrax:work Material`
class Material < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = MaterialIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  self.human_readable_type = 'Material'
  validates :material_creator,                presence:     { message: 'Your material must have a creator.' }
  validates :material_type,                    presence:    { message: 'Your material must have a type.' }
  validates :material_general_research_area, presence:    { message: 'Your material must have a general research area.' }

  include ::Oasis::OasisMetadata

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata

end
