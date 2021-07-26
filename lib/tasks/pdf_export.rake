# To run this task, type:
# RAILS_ENV=production bundle exec rake summaries:export_pdf
require 'open-uri'

namespace :summaries do
  # Export each summary PDF file into ./tmp/pdfs/id-file_name.pdf
  desc 'Export all PDFs files'
  task export_pdf: :environment do
    Summary.all.each do |s| # for all Summaries
      s.file_set_ids.each do |id| # find filesets with PDF
        fs = FileSet.find(id)
        next unless fs.pdf?

        fs.files.each do |f|
          next unless f.mime_type == 'application/pdf' # from the fileset select PDF file (not extracted text)

          name = './tmp/pdfs/' + s.id + '-' + f.file_name[0]
          document = URI.open(f.uri)
          File.open(name, 'wb') do |file|
            puts name
            file.write document.read
          end
          # IO.copy_stream(document.read, name)
        end
      end
    rescue Exception
      puts 'Error while processing: ' + s.id
    end
  end
end