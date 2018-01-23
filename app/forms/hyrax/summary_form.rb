# Generated via
#  `rails generate hyrax:work Summary`
module Hyrax
  class SummaryForm < Hyrax::Forms::WorkForm
    self.model_class = ::Summary
    self.terms += [:resource_type]
  end
end
