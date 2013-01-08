#coding: utf-8

class SearchController < ApplicationController
  skip_before_filter :check_logined

  def result
    @events = Event.where('place LIKE ? AND purpose LIKE ?',
                "%#{params[:place]}%", "%#{params[:purpose]}%").
                upcoming(50).paginate(:page => params[:page], :per_page => 10)
  end

end
