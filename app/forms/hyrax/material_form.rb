# Generated via
#  `rails generate hyrax:work Material`
module Hyrax
  class MaterialForm < Hyrax::Forms::WorkForm
    self.model_class = ::Material
    self.terms += [:resource_type]
  end
end
