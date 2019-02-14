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

      property :parent_summary_id, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#parent_summary_id'), multiple: false do |index|
        index.as :stored_searchable
      end

      property :participants_country, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#participants_country'), multiple: true do |index|
        index.as :stored_searchable
      end

      property :parent_fileset_id, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/oasis#parent_fileset_id'), multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
