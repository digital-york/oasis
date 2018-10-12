module Oasis
  module SolrDocument extend ActiveSupport::Concern
  module Solr
    class Array
      # @return [Array]
      def self.coerce(input)
        ::Array.wrap(input)
      end
    end

    class String
      # @return [String]
      def self.coerce(input)
        ::Array.wrap(input).first
      end
    end

    class Date
      # @return [Date]
      def self.coerce(input)
        field = String.coerce(input)
        return if field.blank?
        begin
          ::Date.parse(field)
        rescue ArgumentError
          Rails.logger.info "Unable to parse date: #{field.first.inspect}"
        end
      end
    end
  end

  included do
    attribute :title_of_summary, Solr::String, solr_name('title_of_summary')

    attribute :summary_writer, Solr::Array, solr_name('summary_writer')
    attribute :summary_writer_all, Solr::String, solr_name('summary_writer_all')

    attribute :summary_general_research_area, Solr::Array, solr_name('summary_general_research_area')
    attribute :summary_general_research_area_other, Solr::String, solr_name('summary_general_research_area_other')

    attribute :language_summary_written_in, Solr::Array, solr_name('language_summary_written_in')
    attribute :language_summary_written_in_other, Solr::String, solr_name('language_summary_written_in_other')

    attribute :summary_linguistictarget, Solr::Array, solr_name('summary_linguistictarget')
    attribute :summary_linguistictarget_other, Solr::String, solr_name('summary_linguistictarget_other')

    attribute :summary_notes, Solr::String, solr_name('summary_notes')

    attribute :participants_type, Solr::Array, solr_name('participants_type')
    attribute :participants_type_other, Solr::String, solr_name('participants_type_other')

    attribute :participants_firstlanguage, Solr::Array, solr_name('participants_firstlanguage')
    attribute :participants_firstlanguage_other, Solr::String, solr_name('participants_firstlanguage_other')

    attribute :participants_targetlanguage, Solr::Array, solr_name('participants_targetlanguage')
    attribute :participants_targetlanguage_other, Solr::String, solr_name('participants_targetlanguage_other')

    attribute :participants_age, Solr::Array, solr_name('participants_age')

    attribute :participants_gender, Solr::String, solr_name('participants_gender')

    attribute :participants_proficiency, Solr::Array, solr_name('participants_proficiency')
    attribute :participants_proficiency_other, Solr::String, solr_name('participants_proficiency_other')

    attribute :participants_type_of_instruction, Solr::String, solr_name('participants_type_of_instruction')

    attribute :participants_amount_of_instruction, Solr::String, solr_name('participants_amount_of_instruction')

    attribute :participants_length_of_residence, Solr::String, solr_name('participants_length_of_residence')

    attribute :participants_age_of_learners_of_arrival, Solr::String, solr_name('participants_age_of_learners_of_arrival')

    attribute :participants_amount_of_prior_instruction, Solr::String, solr_name('participants_amount_of_prior_instruction')

    attribute :participants_time_spent_using_l2, Solr::String, solr_name('participants_time_spent_using_l2')

    attribute :participants_domain_of_use, Solr::Array, solr_name('participants_domain_of_use')
    attribute :participants_domain_of_use_other, Solr::String, solr_name('participants_domain_of_use_other')

    attribute :participants_year_of_teaching_experience, Solr::String, solr_name('participants_year_of_teaching_experience')

    attribute :participants_country, Solr::Array, solr_name('participants_country')
    attribute :participants_country_other, Solr::String, solr_name('participants_country_other')

    attribute :participants_subnational_region, Solr::String, solr_name('participants_subnational_region')

    attribute :participants_educational_stage, Solr::Array, solr_name('participants_educational_stage')
    attribute :participants_educational_stage_other, Solr::String, solr_name('participants_educational_stage_other')

    attribute :participants_institutional_characteristics, Solr::Array, solr_name('participants_institutional_characteristics')
    attribute :participants_institutional_characteristics_other, Solr::String, solr_name('participants_institutional_characteristics_other')

    attribute :publication_author, Solr::Array, solr_name('publication_author')
    attribute :publication_author_all, Solr::String, solr_name('publication_author_all')

    attribute :publication_title, Solr::Array, solr_name('publication_title')

    attribute :publication_journal_name, Solr::String, solr_name('publication_journal_name')
    attribute :publication_journal_name_other, Solr::String, solr_name('publication_journal_name_other')
    attribute :publication_journal_name_other_url, Solr::String, solr_name('publication_journal_name_other_url')

    attribute :publication_date, Solr::String, solr_name('publication_date')

    attribute :publication_volume, Solr::String, solr_name('publication_volume')

    attribute :publication_issue, Solr::String, solr_name('publication_issue')

    attribute :publication_pages_from, Solr::String, solr_name('publication_pages_from')

    attribute :publication_pages_to, Solr::String, solr_name('publication_pages_to')

    attribute :publication_identifier, Solr::String, solr_name('publication_identifier')

    attribute :emails, Solr::String, solr_name('emails')

    attribute :licence_agreement, Solr::String, solr_name('licence_agreement')

    attribute :comments, Solr::String, solr_name('comments')

    attribute :of_likely_interest_to, Solr::Array, solr_name('of_likely_interest_to')
    attribute :of_likely_interest_to_other, Solr::String, solr_name('of_likely_interest_to_other')

    attribute :materials_on_iris, Solr::String, solr_name('materials_on_iris')

    attribute :iris_url, Solr::String, solr_name('iris_url')
  end
  end
end