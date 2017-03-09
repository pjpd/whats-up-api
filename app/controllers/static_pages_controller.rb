class StaticPagesController < ApplicationController

  def is_text_at_url
    agent = Mechanize.new
    if params[:url].nil?
      json_response("no url specified", 400)
    else
      agent.get params[:url]
      @text_is_at_url = agent.page.body.include?(params[:text])
      json_response(@text_is_at_url)
    end
  end

end
