module Oasis
  module OasisMetadata extend ActiveSupport::Concern
    included do
      #--------------------------
      #material type group
      property :material_creator,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#creator'), multiple: true
      property :material_type,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#material_type'), multiple: true
      property :material_general_research_area,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#general_research_area'), multiple: true
      property :material_type_of_file,             predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#type_of_file'), multiple: true

      #--------------------------
      #further details group
      property :material_datatype,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#datatype'), multiple: true
      property :material_linguistictarget,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#linguistictarget'), multiple: true
      property :material_funder,                     predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#funder'), multiple: true
      property :material_title,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#title'), multiple: true
      property :material_notes,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#notes'), multiple: true

      #--------------------------
      #participants group
      property :participants_type,                           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type'), multiple: true
      property :participants_firstlanguage,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_firstlanguage'), multiple: true
      property :participants_targetlanguage,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_targetlanguage'), multiple: true
      property :participants_age,                            predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_age'), multiple: false
      property :participants_gender,                         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_gender'), multiple: false
      property :participants_proficiency,                    predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_proficiency'), multiple: true
      property :participants_type_of_instruction,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type_of_instruction'), multiple: true
      property :participants_amount_of_instruction,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_amount_of_instruction'), multiple: false
      property :participants_length_of_residence,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_length_of_residence'), multiple: false
      property :participants_age_of_learners_of_arrival,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_age_of_learners_of_arrival'), multiple: false

      # need to add length of Prior Instruction and Type of Prior Instruction seperately
      property :participants_amount_of_prior_instruction,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_amount_of_prior_instruction'), multiple: true

      property :participants_time_spent_using_l2,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_time_spent_using_l2'), multiple: false
      property :participants_domain_of_use,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_domain_of_use'), multiple: true

      #--------------------------
      #publication and acknowledgements group
      property :relateditem_type,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#relateditem_type'), multiple: true

      #--------------------------
      #communication / licence group
      property :licence,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence'), multiple: true
      property :emails,                   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#emails'), multiple: true

      #--------------------------
      #Submit group
      property :licence_agreement,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence_agreement'), multiple: true
      property :comments,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#comments'), multiple: true
    end
  end
end