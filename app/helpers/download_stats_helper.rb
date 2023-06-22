module DownloadStatsHelper
  def self.total_downloads
    if Figaro.env.download_stats_json.nil?
      '53,962'
    else
      json_string = File.read(Figaro.env.download_stats_json)
      JSON.parse(json_string)['total_downloads']
    end
  end
end
