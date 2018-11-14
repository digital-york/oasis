# Generated via
#  `rails generate hyrax:work Downloader`
module Hyrax
  class DownloaderForm < Hyrax::Forms::WorkForm
    self.model_class = ::Downloader
    self.terms += [:resource_type]
  end
end
