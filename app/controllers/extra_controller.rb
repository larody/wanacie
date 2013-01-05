class ExtraController < ApplicationController
  def paging
    @events = Event.all
    paginate(:page => params[:page], :per_page => 5)
  end
end

