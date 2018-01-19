module Oasis
  module OasisMetadata extend ActiveSupport::Concern
    included do
      #--------------------------
      #material type group
      property :material_creator,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_type,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_general_research_area,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_type_of_file,             predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

      #--------------------------
      #further details group
      property :material_datatype,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_linguistictarget,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_funder,                     predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_title,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :material_notes,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

      #--------------------------
      #participants group
      property :participants_type,                           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :participants_firstlanguage,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :participants_targetlanguage,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :participants_age,                            predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: false
      property :participants_gender,                         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: false
      property :participants_proficiency,                    predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :participants_type_of_instruction,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :participants_amount_of_instruction,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: false
      property :participants_length_of_residence,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: false
      property :participants_age_of_learners_of_arrival,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: false

      # need to add length of Prior Instruction and Type of Prior Instruction seperately
      property :participants_amount_of_prior_instruction,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

      property :participants_time_spent_using_l2,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: false
      property :participants_domain_of_use,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

      #--------------------------
      #publication and acknowledgements group
      property :relateditem_type,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

      #--------------------------
      #communication / licence group
      property :licence,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :emails,                   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true

      #--------------------------
      #Submit group
      property :licence_agreement,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
      property :comments,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies#oasis'), multiple: true
    end
  end
end