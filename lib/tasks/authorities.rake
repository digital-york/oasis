namespace :authorities do
  require 'yaml'

  solrconfig = YAML.load_file('config/solr.yml')
  SOLR = solrconfig[Rails.env]['url']

  def save_terms_to_file(terms, filename)
    output = File.open( filename, "w" )
    output << "terms:\n"
    other_term = nil
    terms.each do |t|
      if t["term"].downcase != 'other'
        output << "  - id: " + t["id"].to_s + "\n"
        output << "    term: \"" + t["term"] +"\"\n"
      else
        other_term = t
      end
    end
    output << "  - id: "    + other_term["id"].to_s + "\n"
    output << "    term: \""+ other_term["term"] +"\"\n"
    output.close
  end

  # To run this task, type:
  # rake authorities:update_yaml[x.csv]
  desc "Generating authorities YAML texts from CSV..."
  task :create_yaml, [:sourcefile] => [:environment] do |t, args|
    puts "Source file: " + args[:sourcefile]
    #puts "Target file: " + args[:targetfile]

    puts 'terms:'
    File.foreach(args[:sourcefile]).with_index do |line, line_num|
      puts "  - id: #{line_num+1}"
      puts "    term: \"#{line.squish}\""
    end
  end

  # To run this task, type:
  # rake authorities:add_terms[journals.yml,/var/tmp/new_journals.csv,/var/tmp/updated_journals.yml]
  # be careful with the special characters in the CSV file, especially in the first line!
  desc "Updating authorities YAML file from CSV..."
  task :add_terms, [:yamlfile, :csvfile, :targetfile] => [:environment] do |t, args|
    yaml = YAML.load_file(File.dirname(__FILE__) + '/../../config/authorities/' + args[:yamlfile])
    terms = yaml['terms']
    max_id = 0
    terms.each do |t|
      max_id = t['id'].to_i if t['id'].to_i>max_id  # and t['term'].downcase!='other'
    end

    File.foreach(args[:csvfile]).with_index do |line, line_num|
      newid    = max_id+line_num+1
      newlabel = line.squish
      if newlabel.strip! !=''
        terms << {"id"=>newid, "term"=>newlabel}
      end
    end
    sorted_terms = terms.sort_by {|k| k["term"]}
    save_terms_to_file(sorted_terms, args[:targetfile])
  end

  # To run this task, type:
  # rake authorities:delete_terms[journals.yml,/var/tmp/terms.csv,/var/tmp/updated_journals.yml]
  desc "Deleting authorities terms from CSV..."
  task :del_terms, [:yamlfile,:csvfile,:targetfile] => [:environment] do |t, args|
    yaml = YAML.load_file(File.dirname(__FILE__) + '/../../config/authorities/' + args[:yamlfile])
    terms = yaml['terms']

    File.foreach(args[:csvfile]) do |line|
      terms.delete_if {|t| t['term']==line.squish}
    end
    save_terms_to_file(terms, args[:targetfile])
  end
end