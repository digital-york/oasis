# Generated via
#  `rails generate hyrax:work Downloader`
module Hyrax
  class DownloaderForm < Hyrax::Forms::WorkForm
    self.model_class = ::Downloader

    self.terms = [:downloader_email,
                  :downloader_status,
                  :downloader_affiliation,
                  :downloader_contable,
                  :downloader_cty
    ]
    self.required_fields = [
        :downloader_status
    ]

    def self.build_permitted_params
      super + [
          :downloader_email,
          :downloader_status,
          :downloader_affiliation,
          :downloader_contable,
          :downloader_cty
      ]
    end
  end
end
