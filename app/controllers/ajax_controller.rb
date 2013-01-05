require 'net/http'

class AjaxController < ApplicationController
  def time_update
    @time = Time.now.to_s
  end

  def search
    @events = Event.select('DISTINCT place')
  end

  def result
    sleep(2)
    @events = Event.where(:place => params[:place])
  end

  def yahoo
    Net::HTTP.start('search.yahooapis.jp') do |http|
      response = http.get('http://search.yahooapis.jp/WebSearchService/V2/webSearch?appid=Jb1zOHGxg65z_CIxaxCo6MPsNz7ATocO8d4zUy2l9q0T4aro9Uk2m7iOIJ.lmw--&query=' +
      ERB::Util.url_encode(params[:keyword]))
      @body = Hash.from_xml(response.body)
    end
  end
end

