class SurveyController < ApplicationController
  protect_from_forgery

  with_themed_layout 'survey'

  def new
  end

  def submit
    begin
      summary_id         = params["summary_id"]
      summary_fileset_id = params["summary_fileset_id"]
      summary_participants_country = params["participants_country"]

      d = Summary.find(summary_id).downloaders.new
      d.downloader_status      = params["survey"]["status"] unless params["survey"]["status"].nil?
      d.downloader_email       = params["email"]            unless params["email"].nil?
      d.participants_country = summary_participants_country
      d.save!

      redirect_to '/survey/saved?survey_done=yes&summary_id=' + summary_id.to_s + '&downloader_id=' + d.id.to_s + '&fileset_id=' + summary_fileset_id.to_s
    rescue
      redirect_to '/survey/error'
    end
  end
end
