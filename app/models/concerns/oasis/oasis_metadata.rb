module Oasis
  module OasisMetadata extend ActiveSupport::Concern
    included do
      # --------------------------
      # summary details group
      property :summary_writer,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#writer'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      # store all writer info, including order
      property :summary_writer_all,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#writer_all'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :title_of_summary,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#title'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :summary_general_research_area,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#general_research_area'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      # Add other field for RA
      # all 'other' fields MUST follow convention, e.g. use '_other' after the related field
      property :summary_general_research_area_other,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#general_research_area_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :language_summary_written_in,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#language_summary_written_in'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      property :language_summary_written_in_other,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#language_summary_written_in_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      # --------------------------
      # further details group
      property :summary_linguistictarget,         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#linguistictarget'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :summary_linguistictarget_other,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#linguistictarget_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :summary_notes,                      predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#notes'), multiple: false do |index|
        index.as :stored_searchable
      end

      # --------------------------
      # participants group
      property :participants_type,                           predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      property :participants_type_other,                    predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_type_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_firstlanguage,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_firstlanguage'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_firstlanguage_other,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_firstlanguage_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_targetlanguage,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_targetlanguage'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_targetlanguage_other,                predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_targetlanguage_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_age,                            predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_age'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_gender,                         predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_gender'), multiple: false do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      property :participants_proficiency,                    predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_proficiency'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_proficiency_other,              predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_proficiency_other'), multiple: false do |index|
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
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_domain_of_use_other,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_domain_of_use_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_year_of_teaching_experience,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_year_of_teaching_experience'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :participants_country,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_country'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :participants_country_other, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_country_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_subnational_region,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_subnational_region'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_educational_stage,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_educational_stage'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :participants_educational_stage_other,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_educational_stage_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_institutional_characteristics,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_institutional_characteristics'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :participants_institutional_characteristics_other,  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_institutional_characteristics_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      # --------------------------
      # publication and acknowledgements group
      property :publication_author,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_author'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      # tempoary all publication authors in APA format
      property :publication_author_all,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_author_all'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :publication_title,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_title'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :publication_journal_name,          predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_journal_name'), multiple: false do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      # Add other field for journal_name
      # all 'other' fields MUST follow convention, e.g. use '_other' after the related field
      property :publication_journal_name_other,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_journal_name_other'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :publication_journal_name_other_url,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_journal_name_other_url'), multiple: false do |index|
        index.as :stored_searchable
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
      property :publication_identifier,        predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#publication_identifier'), multiple: false do |index|
        index.as :stored_searchable
      end

      # --------------------------
      # communication / licence group
      #property :licence,                  predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence'), multiple: false do |index|
      #  index.as :stored_searchable
      #end
      property :emails,                   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#emails'), multiple: false do |index|
        index.as :stored_searchable
      end

      # --------------------------
      # Submit group
      property :licence_agreement,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#licence_agreement'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :comments,                 predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#comments'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :of_likely_interest_to,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#of_likely_interest_to'), multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :of_likely_interest_to_other,   predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#of_likely_interest_to_other'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :materials_on_iris,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#materials_on_iris'), multiple: false do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :iris_url,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#iris_url'), multiple: false do |index|
        index.as :stored_searchable
      end
      property :original_article_open_access,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#original_article_open_access'), multiple: false do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
      property :other_versions,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#other_versions'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :related_materials_title,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#related_materials_title'), multiple: true do |index|
        index.as :stored_searchable
      end
      property :related_materials_url,       predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#related_materials_url'), multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
