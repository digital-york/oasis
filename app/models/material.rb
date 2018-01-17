# Generated via
#  `rails generate hyrax:work Material`
class Material < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = MaterialIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your material must have a title.' }

  self.human_readable_type = 'Material'

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata

  #material type group
  property :material_type, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_title, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_creator, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_funder, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_format, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_datatype, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_linguistictarget, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_sourcelanguage, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_notes, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :material_rights, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :participants_type, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :participants_firstlanguage, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :participants_targetlanguage, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
  property :participants_age, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

  #further details group
  
  #participants group

  #publication group

  #acknowledgements group

  #communication / licence group

  #Submit group

end
