module Oasis
  module DownloaderMetadata extend ActiveSupport::Concern
    included do
      property :download_time, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#download_time'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :downloader_email, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#downloader_email'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :downloader_status, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#downloader_status'), multiple: true do |index|
        index.as :stored_searchable
      end

      property :downloader_affiliation, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#downloader_affiliation'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :downloader_contable, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#downloader_contable'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :downloader_country, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#downloader_country'), multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
