#coding: utf-8

class EventsController < ApplicationController
  skip_before_filter :check_logined, :only => ['index', 'show']

  # GET /events
  # GET /events.json
  def index
    @events = Event.upcoming(50).paginate(:page => params[:page], :per_page => 10)

    # Avoid remaining flash[:referer] cache like when a user paths "events/show -> root -> signin" route
    # May should be put it on after_filter
    flash[:referer] = nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @comments = Comment.find_all_by_event_id(@event.id)
    @comment = Comment.new

    flash.keep[:referer] = request.fullpath

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def comment
    @comment = Comment.new(params[:comment])
    @event = Event.find(@comment.event_id)

    # if this isn't exist, it gets no method error.
    @comments = Comment.find_all_by_event_id(@event.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event }
        flash[:comment_created] = t('msg.comment_created')
      else
        format.html { render 'show' }
        flash[:joined] = nil
        flash[:comment_created] = nil
        flash[:event_created] = nil
      end 
    end 
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @fixed_datetime = fix_datetime 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def fix_datetime
    now = Time.now
    year = now.year
    day = now.day
    hour = now.hour
    min = (now.min/10.0).ceil * 10
    sec = 59

    if min > 59
      min = 0 
      hour += 1
      if hour > 24
        hour = 0 
        day += 1
        if month > 12
          month = 0 
          year += 1
        end 
      end 
    end 

    Time.local(year, month, day, hour, min, sec)
  end
  private :fix_datetime

=begin
  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end
=end

  # POST /events
  # POST /events.json
  def create
    Event.transaction do
      @event = Event.new(params[:event])
      @event.held_datetime += 1.days unless @event.held_datetime > Time.now
      @event.save!
      participant = Participant.new ( {
        :event_id => @event.id, :user_id => session[:user_id], :organizer => true } )
      participant.save!
    end
    # Success
    respond_to do |format|
      format.html { redirect_to @event }
      flash[:event_created] = t('msg.event_created')
      format.json { render json: @event, status: :created, location: @event }
    end
    # Fail
    rescue
    respond_to do |format|
      format.html { render action: "new" }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

=begin
  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
=end

  # POST /events/1/join
  def join
    # Try to save participant and comment
    Event.transaction do
      # Add to participantsTB
      @participant = Participant.new ( {
        :event_id => params[:id], :user_id => session[:user_id], :organizer => false } )
      @participant.save!

      # Add to commentsTB
      comment = Comment.new ( {
        :event_id => @participant.event_id, :user_id => @participant.user_id,
        :msg => '参加します！' } )
      comment.save!
    end

    # Success
    respond_to do |format|
      format.html { redirect_to event_path(@participant.event_id) }
      flash[:joined] = t('msg.joined')
    end

    # Fail
    rescue
    respond_to do |format|
      format.html { render action: "index" }
    end

  end
end
