namespace :authorities do
  require 'yaml'

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
end