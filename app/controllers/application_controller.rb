class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def is_text_at_url(text, url)
    begin
      agent = Mechanize.new
      agent.get url
      agent.page.body.include?(text)
    rescue
      'false'
    end
  end

end
