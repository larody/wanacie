#coding: utf-8

class EventsController < ApplicationController
  skip_before_filter :check_logined, :only => ['index', 'show']

  # GET /events
  # GET /events.json
  def index
    @events = Event.upcoming(50).paginate(:page => params[:page], :per_page => 10)

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
        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
        format.json { render json: @event, status: :created, location: @comment }
      else
        format.html { render 'show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end 
    end 
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

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
      format.html { redirect_to @event, notice: 'Event was successfully created.' }
      format.json { render json: @event, status: :created, location: @event }
    end
    # Fail
    rescue
    respond_to do |format|
      format.html { render action: "new" }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

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
      format.html { redirect_to event_path(@participant.event_id), notice: 'このイベントに参加しました！' }
    end

    # Fail
    rescue
    respond_to do |format|
      format.html { render action: "index" }
    end

  end
end
