# Generated via
#  `rails generate hyrax:work Material`

module Hyrax
  class MaterialsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Material

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::MaterialPresenter
  end
end
