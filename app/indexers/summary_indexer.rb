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
           if object[field_name].is_a? String and object[field_name]!=''
             if object[field_name].starts_with? 'http' or object[field_name].to_i <= 0
               solr_doc[field_name+'_label_tesim'] = GenericLocalAuthorityService.id_to_label(authority_filename, object[field_name])
             else
               solr_doc[field_name+'_label_tesim'] = GenericLocalAuthorityService.id_to_label(authority_filename, object[field_name].to_i)
             end
           elsif object[field_name].size>0
             labels = []
             object[field_name].each do |id|
               unless (id.nil? or id=='')
                 if id.starts_with? 'http' or id.to_i <= 0
                   labels << GenericLocalAuthorityService.id_to_label(authority_filename, id)
                 else
                   labels << GenericLocalAuthorityService.id_to_label(authority_filename, id.to_i)
                 end
               end
             end
             solr_doc[field_name+'_label_tesim'] = labels
           else
             Rails.logger.info('ignored empty field: ' + field_name)
           end
         end
       rescue
         Rails.logger.error('Failed while indexing label for ' + field_name)
       end
     end
   end
  end
end
