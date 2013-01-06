class CommentsController < ApplicationController
 skip_before_filter :check_logined

  # GET /comments/1
  # GET /comments/1.json
=begin
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    event = Event.find(@comment.event_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to event, notice: 'Comment was successfully created.' }
        format.json { render json: event, status: :created, location: @comment }
      else
        format.html { redirect_to event, alert: @comment.errors[:msg] }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
=end
end
