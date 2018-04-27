# To run this task, type:
# RAILS_ENV=development bundle exec rake thumbnails:update_date
#   OR
# RAILS_ENV=production bundle exec rake thumbnails:update_date
namespace :thumbnails do
  require 'yaml'

  # This task is used to update thumbnail's modified date to make it visible in the object's show page
  desc "Updating thumbnails date..."
  task :update_date => :environment do
    Summary.find_each do |s|
      unless s.nil?
        unless s.thumbnail.nil?
          puts "Updating #{s.id} => from #{s.thumbnail.date_modified.to_s} to #{Time.now}"
          s.thumbnail.date_modified = Time.now
          s.thumbnail.save
        else
          puts "    no thumbnail, bypass #{s.id}"
        end
      end
    end
  end
end