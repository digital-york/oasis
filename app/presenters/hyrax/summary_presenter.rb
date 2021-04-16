# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryPresenter < Hyrax::WorkShowPresenter
    delegate :title_of_summary, :summary_writer_all, :date_uploaded, :publication_author, :publication_journal_name,
             :publication_date, to: :solr_document

    def summary_description
      description = "OASIS summary of: "
      authors = @solr_document.publication_author_all unless @solr_document.publication_author_all.nil?
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
    end

    def summary_thumbnail_url
      fileset_id = Summary.find(@solr_document.id).thumbnail_id
      return "https://oasis-database.org/downloads/#{fileset_id}?file=thumbnail" unless fileset_id.empty?

      'https://oasis-database.org/assets/oasis.png'
    end
  end
end
