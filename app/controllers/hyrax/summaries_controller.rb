# Generated via
#  `rails generate hyrax:work Summary`

module Hyrax
  class SummariesController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Summary

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::SummaryPresenter
  end
end
