module Oasis
  module OasisMetadata extend ActiveSupport::Concern
    included do
      #--------------------------
      #summary details group
      property :summary_creator,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#creator'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :summary_type,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#summary_type'), multiple: true do |index|
          index.as :stored_searchable, :sortable
      end
      property :summary_general_research_area,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#general_research_area'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :summary_type_of_file,             predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#type_of_file'), multiple: true do |index|
        index.as :stored_searchable, :sortable
      end

      #--------------------------
      #further details group
      property :summary_datatype,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#datatype'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :summary_linguistictarget,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#linguistictarget'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :summary_funder,                     predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#funder'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :summary_title,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#title'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :summary_notes,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#notes'), multiple: true do |index|
        index.as :stored_searchable
      end

      #--------------------------
      #participants group
      property :participants_type,                           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :participants_firstlanguage,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_firstlanguage'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_targetlanguage,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_targetlanguage'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_age,                            predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_age'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_gender,                         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_gender'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_proficiency,                    predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_proficiency'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :participants_type_of_instruction,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type_of_instruction'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :participants_amount_of_instruction,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_amount_of_instruction'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_length_of_residence,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_length_of_residence'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_age_of_learners_of_arrival,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_age_of_learners_of_arrival'), multiple: false do |index|
        index.as :stored_searchable
      end

      # need to add length of Prior Instruction and Type of Prior Instruction seperately
      property :participants_amount_of_prior_instruction,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_amount_of_prior_instruction'), multiple: true do |index|
        index.as :stored_searchable
      end

      property :participants_time_spent_using_l2,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_time_spent_using_l2'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_domain_of_use,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_domain_of_use'), multiple: true do |index|
        index.as :stored_searchable
      end

      #--------------------------
      #publication and acknowledgements group
      property :relateditem_type,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#relateditem_type'), multiple: true do |index|
        index.as :stored_searchable
      end

      #--------------------------
      #communication / licence group
      property :licence,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :emails,                   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#emails'), multiple: true do |index|
        index.as :stored_searchable
      end

      #--------------------------
      #Submit group
      property :licence_agreement,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence_agreement'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :comments,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#comments'), multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end