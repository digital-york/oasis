# To run this task, type:
# RAILS_ENV=production bundle exec rake datachecking:otherfields

namespace :datachecking do
  # This task is used to check multiple 'other' fields and generate a report
  desc "Checking other fields..."
  task :otherfields => :environment do
    general_research_area_other = []
    proficiency_others          = []
    errors                      = []
    Summary.all.each do |s|
      begin
        general_research_area_other << s.id if s.summary_general_research_area_other.length>1
        proficiency_others          << s.id if s.participants_proficiency_other.length>1
      rescue Exception
        errors << s.id
      end
    end
    puts 'RA'
    puts '-------------------'
    puts general_research_area_other
    puts

    puts 'proficiency_others'
    puts '-------------------'
    puts proficiency_others
    puts

    puts 'errors'
    puts '-------------------'
    puts errors
  end
end