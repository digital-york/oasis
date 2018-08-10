# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryForm < Hyrax::Forms::WorkForm
    self.model_class = ::Summary
    self.terms = [:summary_writer,
                  :summary_writer_all,
                  :title_of_summary,
                  :language_summary_written_in,
                  :language_summary_written_in_other,
                  :publication_identifier,
                  :publication_author,
                  :publication_author_all,
                  :publication_title,
                  :publication_date,
                  :publication_journal_name,
                  :publication_journal_name_other,
                  :publication_volume,
                  :publication_issue,
                  :publication_pages_from,
                  :publication_pages_to,
                  :summary_general_research_area,
                  :summary_general_research_area_other,
                  :summary_linguistictarget,
                  :participants_type,
                  :participants_type_other,
                  :participants_firstlanguage,
                  :participants_firstlanguage_other,
                  :participants_targetlanguage,
                  :participants_targetlanguage_other,
                  :participants_age,
                  :participants_gender,
                  :participants_proficiency,
                  :participants_proficiency_other,
                  :participants_type_of_instruction,
                  :participants_amount_of_instruction,
                  :participants_length_of_residence,
                  :participants_age_of_learners_of_arrival,
                  :participants_amount_of_prior_instruction,
                  :participants_time_spent_using_l2,
                  :participants_domain_of_use,
                  :participants_domain_of_use_other,
                  :participants_year_of_teaching_experience,
                  :participants_country,
                  :participants_subnational_region,
                  :participants_educational_stage,
                  :participants_educational_stage_other,
                  :participants_institutional_characteristics,
                  :of_likely_interest_to,
                  :of_likely_interest_to_other,
                  :materials_on_iris,
                  :iris_url,
                  :licence,
                  :licence_agreement,
                  :emails,
                  :notification_of_download,
                  :summary_notes,
                  :comments
    ]

    self.required_fields = [:summary_writer,
                            :title_of_summary,
                            :language_summary_written_in,
                            :publication_author,
                            :publication_title,
                            :publication_date,
                            :publication_journal_name,
                            :publication_volume,
                            :publication_issue,
                            :publication_pages_from,
                            :publication_pages_to,
                            :summary_general_research_area,
                            :participants_type,
                            :of_likely_interest_to,
                            :materials_on_iris,
                            :licence,
                            :licence_agreement,
                            :emails,
                            :notification_of_download
                         ]

    def self.build_permitted_params
      super + [
          :visibility,
          :licence_agreement,
          :admin_set_id,
          :member_of_collection_ids
      ]
    end
  end
end
