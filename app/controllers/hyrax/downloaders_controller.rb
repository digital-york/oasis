# Generated via
#  `rails generate hyrax:work Downloader`

module Hyrax
  class DownloadersController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Downloader

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::DownloaderPresenter

    with_themed_layout 'blank'
  end
end
