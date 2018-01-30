# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryForm < Hyrax::Forms::WorkForm
    self.model_class = ::Summary
    self.terms = [:summary_writer,
                  :title_of_summary,

                  :summary_general_research_area,
                  :summary_linguistictarget,
                  :participants_targetlanguage,
                  :participants_firstlanguage,

                  :publication_date,
                  :publication_title,

                  :participants_type,
                  :participants_gender,
                  :participants_proficiency,
                  :participants_domain_of_use,

                  :conference_name,
                  :material_on_IRIS,


                  :summary_notes,

                  :participants_age,
                  :participants_type_of_instruction,
                  :participants_amount_of_instruction,
                  :participants_length_of_residence,
                  :participants_age_of_learners_of_arrival,

                  :participants_amount_of_prior_instruction,

                  :participants_time_spent_using_l2,

                  :publication_author,
                  :publication_journal_name,
                  :publication_volume,
                  :publication_issue,
                  :publication_pages_from,
                  :publication_pages_to,
                  :publication_identifier,

                  :licence,
                  :emails,
                  :licence_agreement,
                  :comments
    ]

    self.required_fields = [:title_of_summary,:summary_writer,:publication_author,:summary_general_research_area]
  end
end
