# To run this task, type:
# RAILS_ENV=production bundle exec rake report:downloader_per_status

namespace :report do
    require 'figaro'
    require 'date'
    require 'mail'

    SOLR = Figaro.env.solr_url

    # define status value to desc map
    STATUS_MAP = {
        'curriculum_developer'              => 'Curriculum / materials developer',
        'language_teacher'                  => 'Language teacher/instructor',
        'language_teacher_pre_elementary'   => 'Pre-elementary / kindergarten',
        'language_teacher_primary'          => 'Primary school',
        'language_teacher_secondary'        => 'Secondary / high school',
        'language_teacher_tertiary'         => 'Tertiary / university',
        'language_teacher_adult_edu'        => 'Adult education',
        'language_teacher_private'          => 'Private institution',
        'language_teacher_other'            => 'Other teacher',
        'media'                             => 'Media / journalist',
        'parent'                            => 'Parent',
        'policy_maker'                      => 'Policy maker',
        'professional_development_provider' => 'Professional development provider',
        'student'                           => 'Student',
        'undergraduate'                     => 'Undergraduate',
        'masters'                           => 'Masters',
        'phd'                               => 'PhD',
        'other'                             => 'Other student',
        'teacher_educator'                  => 'Teacher educator',
        'test_developer'                    => 'Test developer',
        'university_academic'               => 'University academic',
        'early_career'                      => 'Early career',
        'mid_career'                        => 'Mid-career',
        'established_scholar'               => 'Established scholar'
    }.freeze

    # define parent status type map
    STATUS_PARENT_MAP = {
        'language_teacher_pre_elementary'   => 'language_teacher',
        'language_teacher_primary'          => 'language_teacher',
        'language_teacher_secondary'        => 'language_teacher',
        'language_teacher_tertiary'         => 'language_teacher',
        'language_teacher_adult_edu'        => 'language_teacher',
        'language_teacher_private'          => 'language_teacher',
        'language_teacher_other'            => 'language_teacher',
        'undergraduate'                     => 'student',
        'masters'                           => 'student',
        'phd'                               => 'student',
        'other'                             => 'student',
        'early_career'                      => 'university_academic',
        'mid_career'                        => 'university_academic',
        'established_scholar'               => 'university_academic'
    }.freeze

    desc 'Generate downloader statistics per status'
    task :downloader_per_status => :environment do
        results = {}

        solr_query = 'has_model_ssim:Downloader'
        solr = RSolr.connect :url => SOLR
        response = solr.get 'select', :params => {
            :q=>"#{solr_query}",
            :start=>0,
            :rows=>2147483647
        }
        number_of_downloaders = response['response']['numFound']
        if number_of_downloaders == 0
            puts 'No downloader found.'
        else
            puts "Total downloads: #{number_of_downloaders}"
            puts '------------------------------'

            response['response']['docs'].each do |doc|
                current_doc_status = {}
                unless doc['downloader_status_tesim'].nil?
                    doc['downloader_status_tesim'].each do |status|
                        # if current status is top level status
                        if STATUS_PARENT_MAP[status].nil?
                            current_doc_status[status] = 1
                        else
                            # if current status has a parent status, store its parent status
                            current_doc_status[STATUS_PARENT_MAP[status]] = 1
                        end
                    end
                    unless current_doc_status.length == 0
                        current_doc_status.keys.each do |status|
                            if results[status].nil?
                                results[status] = 1
                            else
                                results[status] = results[status] + 1
                            end
                        end
                    end
                end
            end

            results.each do |k,v|
                puts "#{STATUS_MAP[k]} => #{v}"
            end
        end
    end

    desc 'Generate downloader statistics per month'
    task :downloader_per_month => :environment do
        results = {}

        solr_query = 'has_model_ssim:Downloader'
        solr = RSolr.connect :url => SOLR
        response = solr.get 'select', :params => {
            :q=>"#{solr_query}",
            :start=>0,
            :rows=>2147483647
        }
        number_of_downloaders = response['response']['numFound']
        if number_of_downloaders == 0
            puts 'No downloader found.'
        else
            puts "Total downloads: #{number_of_downloaders}"
            puts '------------------------------'

            response['response']['docs'].each do |doc|
                download_time = Date.parse(doc['system_create_dtsi']).strftime("%Y.%m")
                if results[download_time].nil?
                    results[download_time] = 1
                else
                    results[download_time] = results[download_time] + 1
                end
            end

            results.each do |k,v|
                puts "#{k} => #{v}"
            end
        end
    end

    # bundle exec rake report:downloader_per_email
    desc 'Generate downloader statistics per email'
    task :downloader_per_email => :environment do
        results = {}

        solr_query = 'has_model_ssim:Downloader'
        solr = RSolr.connect :url => SOLR
        response = solr.get 'select', :params => {
            :q=>"#{solr_query}",
            :start=>0,
            :rows=>2147483647
        }
        number_of_downloaders = response['response']['numFound']
        if number_of_downloaders == 0
            puts 'No downloader found.'
        else
            puts "Total downloads: #{number_of_downloaders}"
            puts '------------------------------'

            response['response']['docs'].each do |doc|
                unless doc['downloader_email_tesim'].nil?
                    doc['downloader_email_tesim'].each do |email|
                        # if current email is top level status
                        if results[email].blank?
                            results[email] = 1
                        else
                            results[email] = results[email] + 1
                        end
                    end
                end
            end

            results.each do |k,v|
                puts "#{k} => #{v}"
            end
        end
    end

end