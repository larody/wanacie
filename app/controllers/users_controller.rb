#coding: utf-8

class UsersController < ApplicationController
  before_filter :check_logined, :except => ['show', 'new', 'create']

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /name
  # GET /name.json
  def show
    @user = User.find_by_name(params[:name])
    @participants = Participant.find_all_by_user_id(@user.id).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  # GET /user/setting
  def edit
    @user = User.find(session[:user_id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_by_name_path(@user.name) }
        flash[:user_created] = t('msg.user_created')
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/name
  # PUT /users/name.json
  def update
    @user = User.find_by_name(params[:user][:name])

    respond_to do |format|
      begin
	# Including validate presence of password
	@user.update_attributes!(params[:user])
        # Encode a password
        @user.update_attributes!(
          :password => Digest::SHA1.hexdigest(
       	    @user.password + Wanacie::Application.config.password_salt),
          :password_confirmation => Digest::SHA1.hexdigest(
       	    @user.password_confirmation + Wanacie::Application.config.password_salt))

        format.html { redirect_to user_by_name_path(@user.name) , notice: 'User was successfully updated.' }
        format.json { head :no_content }
      rescue
        format.html { render 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(session[:user_id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end
