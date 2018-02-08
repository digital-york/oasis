module Oasis
  module OasisMetadata extend ActiveSupport::Concern
    included do
      #--------------------------
      #summary details group
      property :summary_writer,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#writer'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :title_of_summary,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#title'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :summary_general_research_area,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#general_research_area'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      #--------------------------
      #further details group
      property :summary_linguistictarget,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#linguistictarget'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
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
      property :participants_type_of_instruction,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type_of_instruction'), multiple: false do |index|
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
      property :participants_amount_of_prior_instruction,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_amount_of_prior_instruction'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_time_spent_using_l2,           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_time_spent_using_l2'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_domain_of_use,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_domain_of_use'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :participants_year_of_teaching_experience,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_year_of_teaching_experience'), multiple: false do |index|
        index.as :stored_searchable
      end


      #--------------------------
      #publication and acknowledgements group
      property :publication_author,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_author'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :publication_title,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_title'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :publication_journal_name,          predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_journal_name'), multiple: false do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :publication_date,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_date'), multiple: false do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :publication_volume,               predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_volume'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :publication_issue,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_issue'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :publication_pages_from,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_pages_from'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :publication_pages_to,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_pages_to'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :publication_identifier,        predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_pages_from'), multiple: false do |index|
        index.as :stored_searchable
      end

      #--------------------------
      #communication / licence group
      property :licence,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :emails,                   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#emails'), multiple: false do |index|
        index.as :stored_searchable
      end

      #--------------------------
      #Submit group
      property :licence_agreement,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence_agreement'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :comments,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#comments'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :materials_on_iris,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#materials_on_iris'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :notification_of_download,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#notification_of_download'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :conference_name,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#conference_name'), multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end