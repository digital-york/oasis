# To run this task, type:
# RAILS_ENV=production bundle exec rake subscription:new_summaries[days_ago,/folder]
# RAILS_ENV=production bundle exec rake subscription:new_summaries[7,/opt/york/digilib/oasis/current/public/subscriptions]
namespace :subscription do
  require 'json'

  # This task search for Summaries no older than a week.
  desc 'Find all Summaries no older than a week ...'
  task :new_summaries, %i[days_ago subscription_folder] => [:environment] do |_task, args|
    subscription_folder = args[:subscription_folder]
    days_ago = args[:days_ago].to_i
    one_week_ago = Time.now - (1 * days_ago * 24 * 60 * 60)
    new_summaries = { all_new_sumaries_since: one_week_ago, summaries: {} }

    puts "Find all Sumamries no older than one week ago #{one_week_ago}"

    Summary.find_each do |s|
      if !s.nil? && (s.date_modified >= one_week_ago)
        puts "Found new summary #{s.id} #{s.date_modified}"
        new_summaries[:summaries][s.id] = {
          title_of_summary: s.title_of_summary,
          categories_topics: {
            summary_general_research_area: s.summary_general_research_area,
            participants_type: s.participants_type,
            of_likely_interest_to: s.of_likely_interest_to,
            language_summary_written_in: s.language_summary_written_in
          }
        }
      end
    end

    puts "Save summaries.json at #{subscription_folder}"
    # Rotate summaries.json => summaries.date.json for leagcy content
    # FileUtils.mkdir_p(subscription_folder) unless File.directory?(subscription_folder)
    unless File.directory?(subscription_folder)
      File.symlink('/opt/york/digilib/oasis/public-files/subscriptions',
                   subscription_folder)
    end
    if File.exist?("#{subscription_folder}/summaries.json")
      FileUtils.mv("#{subscription_folder}/summaries.json",
                   "#{subscription_folder}/summaries.#{one_week_ago.year}-#{one_week_ago.month}-#{one_week_ago.day}.json")
    end
    File.write("#{subscription_folder}/summaries.json", new_summaries.to_json)
  end
end
