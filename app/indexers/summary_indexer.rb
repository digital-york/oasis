# Generated via
#  `rails generate hyrax:work Summary`
class SummaryIndexer < Hyrax::WorkIndexer
  # This indexes the default metadata. You can remove it if you want to
  # provide your own metadata and indexing.
  include Hyrax::IndexesBasicMetadata

  # Fetch remote labels for based_near. You can remove this if you don't want
  # this behavior
  include Hyrax::IndexesLinkedMetadata

  # add custom indexing behavior for authority fields:
  def generate_solr_document
   super.tap do |solr_doc|
     # add authority labels into solr
     OasisAuthorityMapping.authority_mapping_solr2filename.keys.each do |field_name|
       authority_filename = OasisAuthorityMapping.authority_mapping_solr2filename[field_name]
       begin
         unless object[field_name].nil?
           if object[field_name].is_a? String
             solr_doc[field_name+'_label_tesim'] = GenericLocalAuthorityService.id_to_label(authority_filename, object[field_name].to_i)
           else
             labels = []
             object[field_name].each do |id|
               labels << GenericLocalAuthorityService.id_to_label(authority_filename, id.to_i)
             end
             solr_doc[field_name+'_label_tesim'] = labels
           end
         end
       rescue
         Rails.logger.error('Failed while indexing label for ' + field_name)
       end
     end
   end
  end
end
