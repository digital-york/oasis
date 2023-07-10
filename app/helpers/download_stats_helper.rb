module DownloadStatsHelper
  def self.total_downloads
    if Figaro.env.download_stats_json.nil?
      '53,962'
    else
      json_string = File.read(Figaro.env.download_stats_json)
      # Read number and format it with comma every thousend 
      JSON.parse(json_string)['total_downloads'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
    end
  end
end
