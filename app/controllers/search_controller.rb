#coding: utf-8

class SearchController < ApplicationController
  skip_before_filter :check_logined

  def result
    @events = Event.where('place LIKE ? AND purpose LIKE ?',
                "%#{params[:place]}%", "%#{params[:purpose]}%").
                paginate(:page => params[:page], :per_page => 5)
  end

end
