# Generated via
#  `rails generate hyrax:work Material`
module Hyrax
  class MaterialForm < Hyrax::Forms::WorkForm
    self.model_class = ::Material
    self.terms = [:material_creator,
                  :material_type,
                  :material_general_research_area,
                  :material_type_of_file,
                  :material_datatype,
                  :material_linguistictarget,
                  :material_funder,
                  :material_title,
                  :material_notes,
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

                  :licence,
                  :emails,
                  :licence_agreement,
                  :comments
        ]

    self.required_fields = [:material_creator,:material_type,:material_general_research_area,:material_type_of_file]
  end
end
