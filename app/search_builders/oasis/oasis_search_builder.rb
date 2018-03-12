module Oasis
  class OasisSearchBuilder < Hyrax::CatalogSearchBuilder
    self.default_processor_chain += [:add_authority_label_field_to_query, :add_oasis_text_fields_to_query]

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
  end
end