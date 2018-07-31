namespace :authorities do
  require 'yaml'
  require 'figaro'

  SOLR = Figaro.env.solr_url

  # save term array into a file
  def save_terms_to_file(terms, filename)
    output = File.open( filename, "w" )
    output << "terms:\n"
    other_term = nil
    terms.each do |t|
      # always add 'Other' to the end of the term list
      if t["term"].downcase != 'other'
        output << "  - id: " + t["id"].to_s + "\n"
        output << "    term: \"" + t["term"] +"\"\n"
      else
        other_term = t
      end
    end
    unless other_term.nil?
      output << "  - id: "    + other_term["id"].to_s + "\n"
      output << "    term: \""+ other_term["term"] +"\"\n"
    end
    output.close
  end

  # Check if a term is referenced by any object before being deleted
  def is_term_used(authority_file_name, term)
    solr_field = OasisAuthorityMapping.authority_mapping_filename2solr[authority_file_name.sub('.yml','')]
    solr = RSolr.connect :url => SOLR
    response = solr.get 'select', :params => {
        :q=>"#{solr_field}_label_tesim:\"#{term}\"",
        :start=>0,
        :rows=>10
    }
    return false if response["response"]["numFound"] == 0
    true
  end

  # To run this task, type:
  # rake authorities:create_yaml[/var/tmp/x.csv,/var/tmp/target.yml]
  desc "Generating authorities YAML texts from CSV..."
  task :create_yaml, [:sourcefile,:targetfile] => [:environment] do |t, args|
    terms = []
    File.foreach(args[:sourcefile]).with_index do |line, line_num|
      terms << {"id"=>line_num+1, "term"=>line.squish}
    end
    save_terms_to_file(terms, args[:targetfile])
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
  # rake authorities:del_terms[journals.yml,/var/tmp/journals_to_delete.csv,/var/tmp/deleted_journals.yml]
  desc "Deleting authorities terms from CSV..."
  task :del_terms, [:yamlfile,:csvfile,:targetfile] => [:environment] do |t, args|
    yaml = YAML.load_file(File.dirname(__FILE__) + '/../../config/authorities/' + args[:yamlfile])
    terms = yaml['terms']

    File.foreach(args[:csvfile]) do |line|
      if is_term_used(args[:yamlfile], line.squish)==false
        terms.delete_if {|t| t['term']==line.squish}
      else
        puts "found #{line.squish}, bypass this term"
      end
    end
    save_terms_to_file(terms, args[:targetfile])
  end

  # To run this task, type:
  # bundle exec rake authorities:create_yaml[FILE_NAME]
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

  # To run this rake task, type:
  # bundle exec rake authorities:create_countries[lib/assets/iso_3166_country_codes.csv] > config/authorities/country_code.yml
  desc "Generating countries YAML from CSV..."
  task :create_countries, [:sourcefile] => [:environment] do |t, args|
    puts 'terms:'
    countries  = Set.new()
    duplicates = Set.new()
    File.foreach(args[:sourcefile]).with_index do |line, line_num|
      next if line_num==0  # bypass the first line which is the title
      #puts "  - id: #{line_num}"
      all_attr = line.squish.split('"')

      if countries.include? all_attr[5].squish
        duplicates << all_attr[5].squish
      end
      countries << all_attr[5].squish
      puts "  - id: #{all_attr[5].squish}"
      puts "    term: \"#{all_attr[1].squish}\""
    end
    if duplicates.length >0
        puts 'ERROR! duplicate detected: ' + duplicates.to_s
    end
  end

  # To run this rake task, type:
  # bundle exec rake authorities:create_us_states[lib/assets/us_states.csv] > config/authorities/us_states.yml
  desc "Generating US states YAML from CSV..."
  task :create_us_states, [:sourcefile] => [:environment] do |t, args|
    puts 'terms:'
    File.foreach(args[:sourcefile]).with_index do |line, line_num|
      next if line_num==0  # bypass the first line which is the title
      puts "  - id: #{line_num}"
      all_attr = line.squish.split(',')
      puts "    abbr: #{all_attr[1].squish}"
      puts "    name: #{all_attr[0].squish}"
    end
  end

end