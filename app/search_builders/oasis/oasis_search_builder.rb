module Oasis
  class OasisSearchBuilder < Hyrax::CatalogSearchBuilder
    self.default_processor_chain += [:add_authority_label_field_to_query, :add_oasis_text_fields_to_query, :add_other_fields_to_query, :only_search_summary]

    # Add OASIS authority label fields to Solr query parameters
    def add_authority_label_field_to_query(solr_parameters)
      OasisAuthorityMapping.authority_mapping_solr2filename.keys.each do |field_name|
        solr_parameters[:qf] += ' %s_label_tesim' % field_name
      end
    end

    # Add OASIS text fields to Solr query parameters
    def add_oasis_text_fields_to_query(solr_parameters)
      solr_parameters[:qf] += ' publication_author_tesim'
      solr_parameters[:qf] += ' publication_title_tesim'
      solr_parameters[:qf] += ' summary_writer_tesim'
      solr_parameters[:qf] += ' title_of_summary_tesim'
    end

    # Add 'other' fields to Solr query parameters
    def add_other_fields_to_query(solr_parameters)
      solr_parameters[:qf] += ' summary_general_research_area_other_tesim'
      solr_parameters[:qf] += ' publication_journal_name_other_tesim'
      solr_parameters[:qf] += ' participants_proficiency_other_tesim'
    end

    # Only query Summaries
    def only_search_summary(solr_parameters)
      solr_parameters[:q] += ' has_model_ssim:Summary'
    end
  end
end