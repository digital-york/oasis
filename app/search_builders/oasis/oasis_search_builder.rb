module Oasis
  class OasisSearchBuilder < Hyrax::CatalogSearchBuilder
    self.default_processor_chain += [:add_authority_label_field_to_query]

    def add_authority_label_field_to_query(solr_parameters)
      OasisAuthorityMapping.authority_mapping_solr2filename.keys.each do |field_name|
        solr_parameters[:qf] += ' %s_label_tesim' % field_name
      end
    end
  end
end