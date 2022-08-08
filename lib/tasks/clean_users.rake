# To run this task, type:
# RAILS_ENV=production bundle exec rake users:clean

admins = ['amber.dudley@york.ac.uk',
          'emma.marsden@york.ac.uk',
          'inge.alferink@york.ac.uk',
          'louise.bibbey@york.ac.uk',
          'mary.richardson@york.ac.uk',
          'sebastiaan.schoonebeek@york.ac.uk',
          'sebastian.palucha@york.ac.uk'].freeze

namespace :users do
  # Export each summary PDF file into ./tmp/pdfs/id-file_name.pdf
  desc 'Clean all none admin users'
  task clean: :environment do
    User.all.each do |u| # for all Summaries
      unless admins.include?(u.email)
        puts 'Destoring ' + u.email
        u.destroy
      end
    rescue Exception => e
      puts 'Error while processing: ' + u.email + ' ' + e.to_s
    end
  end
end
