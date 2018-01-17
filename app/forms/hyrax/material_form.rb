# Generated via
#  `rails generate hyrax:work Material`
module Hyrax
  class MaterialForm < Hyrax::Forms::WorkForm
    self.model_class = ::Material
    self.terms = [:material_type,
                   :material_title,
                   :material_creator,
                   :material_funder,
                   :material_format,
                   :material_datatype,
                   :material_linguistictarget,
                   :material_sourcelanguage,
                   :material_notes,
                   :material_rights,
                   :participants_type,
                   :participants_firstlanguage,
                   :participants_targetlanguage,
                   :participants_age
    ]

    self.required_fields = [:material_type,:material_title]
  end
end
