# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryForm < Hyrax::Forms::WorkForm
    self.model_class = ::Summary
    self.terms = [:summary_creator,
                  :summary_type,
                  :summary_general_research_area,
                  :summary_datatype,
                  :summary_linguistictarget,
                  :summary_funder,
                  :summary_title,
                  :summary_notes,
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

                  :publication_author,
                  :publication_title,
                  :publication_journal_name,
                  :publication_date,
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

    self.required_fields = [:publication_author,:summary_general_research_area]
  end
end
