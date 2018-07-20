namespace :authorities do
  require 'yaml'

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
  # bundle exec rake authorities:create_countries[lib/assets/iso_3166_country_codes.csv]
  desc "Generating countries YAML from CSV..."
  task :create_countries, [:sourcefile] => [:environment] do |t, args|
    puts 'terms:'
    File.foreach(args[:sourcefile]).with_index do |line, line_num|
      next if line_num==0  # bypass the first line which is the title
      puts "  - id: #{line_num}"
      all_attr = line.squish.split(',')
      puts "    code3: #{all_attr[2].squish}"
      puts "    name: #{all_attr[0].squish}"
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