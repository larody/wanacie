#coding: utf-8

class PagesController < ApplicationController

  def show
    if params[:page] && File.exists?(path = "pages/#{params[:page]}.html.erb")
      render :file => path, :layout => true
    else
      render :text => "Page does not exists.", :status => 404
    end
  end

end
