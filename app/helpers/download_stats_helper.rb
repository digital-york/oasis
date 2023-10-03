module DownloadStatsHelper
  def self.total_downloads
    # Number of GA downlowds before GA4
    default_number_of_downloads = '53,962'
    if Figaro.env.download_stats_json.nil?
      default_number_of_downloads
    else
      begin
        json_string = File.read(Figaro.env.download_stats_json)
        # Read number and format it with comma every thousend
        JSON.parse(json_string)['total_downloads'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
      rescue StandardError => e
        Rails.logger.error "DownloadStatsHelper.total_downloads => JSON parsing error: #{e.message}"
        default_number_of_downloads
      end
    end
  end
end
