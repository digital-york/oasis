# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryForm < Hyrax::Forms::WorkForm
    self.model_class = ::Summary
    self.terms = [:summary_writer,
                  :title_of_summary,
                  :publication_identifier,
                  :publication_author,
                  :publication_title,
                  :publication_date,
                  :publication_journal_name,
                  :publication_volume,
                  :publication_issue,
                  :publication_pages_from,
                  :publication_pages_to,
                  :summary_general_research_area,
                  :summary_linguistictarget,
                  :participants_type,
                  :participants_firstlanguage,
                  :participants_targetlanguage,
                  :participants_age,
                  :participants_gender,
                  :participants_proficiency,
                  :participants_type_of_instruction,
                  :participants_amount_of_instruction,
                  :participants_length_of_residence,
                  :participants_age_of_learners_of_arrival,
                  :participants_amount_of_prior_instruction,
                  :participants_time_spent_using_l2,
                  :participants_domain_of_use,
                  :participants_year_of_teaching_experience,
                  :material_on_IRIS,
                  :licence,
                  :licence_agreement,
                  :emails,
                  :notification_of_download,
                  :summary_notes,
                  :conference_name
    ]

    self.required_fields = [:summary_writer,
                            :title_of_summary,
                            :publication_identifier,
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
                            :participants_firstlanguage,
                            :participants_targetlanguage,
                            :material_on_IRIS,
                            :emails,
                            :notification_of_download
                         ]
  end
end
