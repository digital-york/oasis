class SurveyController < ApplicationController
  protect_from_forgery

  with_themed_layout 'survey'

  def new
  end

  def submit
    puts "==================================="
    puts "==================================="

    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end

    puts "==================================="
    puts "==================================="

    redirect_to "/survey/saved?id=555"
  end
end
