# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryPresenter < Hyrax::WorkShowPresenter
    delegate :title_of_summary, :summary_writer_all, :date_uploaded, :publication_author, :publication_journal_name,
             :publication_date, :original_article_open_access, to: :solr_document

    def summary_description
      description = "OASIS summary of: "
      authors = @solr_document.publication_author_all unless @solr_document.publication_author_all.nil?
      original_article_open_access = @solr_document.original_article_open_access unless @solr_document.original_article_open_access.nil?
      if(!@solr_document._source["publication_journal_name_label_tesim"].include? 'Other')

        description = description + Apa.get_reference(JSON.parse(authors),
                               @solr_document.publication_date,
                               @solr_document.publication_title[0],
                               @solr_document.publication_journal_name,
                               true,
                               @solr_document.publication_volume,
                               @solr_document.publication_issue,
                               @solr_document.publication_pages_from,
                               @solr_document.publication_pages_to,
                               @solr_document.publication_identifier)
      else
        description = description + Apa.get_reference_with_other_journal_name(JSON.parse(authors),
                                             @solr_document.publication_date,
                                             @solr_document.publication_title[0],
                                             @solr_document.publication_journal_name_other,
                                             @solr_document.publication_journal_name_other_url,
                                             true,
                                             @solr_document.publication_volume,
                                             @solr_document.publication_issue,
                                             @solr_document.publication_pages_from,
                                             @solr_document.publication_pages_to,
                                             @solr_document.publication_identifier)
      end
      if(original_article_open_access=='Yes')
        description = description + " This article is open access"
      else
        description
      end 
    end

    def summary_thumbnail_url
      fileset_id = Summary.find(@solr_document.id).thumbnail_id
    return "https://oasis-database.org/downloads/#{fileset_id}?file=thumbnail" unless fileset_id.blank?

    'https://oasis-database.org/assets/oasis.png'
     end

    def other_versions_title
      
    other_versions = @solr_document.other_versions
    version = ""
    final_html= ""

      other_versions.each do |summary_id|
        unless other_versions.blank? 
          version = OtherVersions.get_other_versions(summary_id)
          unless version.blank?
            version.each do |version_detail|
              unless version_detail.blank?
                final_html << '<a href="/concern/summaries/'+version_detail['id']+'" title="'+version_detail['title_of_summary_tesim'].join()+'" target="_blank">'+version_detail['title_of_summary_tesim'].join()+'</a><br>'
              end
            end
          end
        end      
      end

    return final_html
    end

  end
end
