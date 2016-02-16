class StartupsController < ApplicationController
  before_action :signed_in_user,only: [:index,:new,:edit,:update,:destroy,:all,:show]
  before_action :set_startup, only: [:show, :edit, :update, :destroy]
  before_action :user_entrepreneur,only: [:index,:new,:edit,:create,:update,:destroy]
  require 'will_paginate/array'
  # GET /startups
  # GET /startups.json
  def index
    #@startups = Startup.all
    @user = current_user
    @startups = @user.startups.paginate(page: params[:page])
  end

  def all
    #@startups=Startup.paginate(page: params[:page])
    store_location
    @search = Search.new(:startup, params[:search])
    @search.order = 'name'
    @startups = (@search.run).paginate(:page => params[:page], :per_page => 9)
  end
  
  def follow
    store_location
    @startup=Startup.find(params[:id])
    current_user.follow!(@startup)
    redirect_back_or current_user
  end

  def unfollow
    store_location
    @startup=Startup.find(params[:id])
    current_user.unfollow!(@startup)
    redirect_back_or current_user
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    store_location
    set_startup_id(@startup)
    @microposts = @startup.microposts.paginate(page: params[:page])
    @nmicropost = @startup.microposts.build
    @students = @startup.followers(Student).paginate
  end

  # GET /startups/new
  def new
    @startup = Startup.new
  end

  # GET /startups/1/edit
  def edit
  end

  # POST /startups
  # POST /startups.json
  def create
    @startup = Startup.new(startup_params)
    @startup.entrepreneur_id=current_user.id
    @startup.pic=current_user.pic
    respond_to do |format|
      if @startup.save
        format.html { redirect_to @startup }
        format.json { render action: 'show', status: :created, location: @startup }
        flash[:success] = "Startup was successfully created"
      else
        format.html { render action: 'new' }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /startups/1
  # PATCH/PUT /startups/1.json
  def update
    respond_to do |format|
      if @startup.update(startup_params)
        format.html { redirect_to @startup }
        format.json { head :no_content }
        flash[:success] = "Startup was successfully updated"
      else
        format.html { render action: 'edit' }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @startup.destroy
    respond_to do |format|
      format.html { redirect_to startups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_startup
      @startup = Startup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def startup_params
      params.require(:startup).permit(:name, :link, :about, :founderinfo, :entrepreneur_id, :pic,:location,:size,:phone,:email,:tagline,:funding)
    end

    

   def user_entrepreneur
      @user = Users.find_by(email: current_user.email)
      if @user.type!="Entrepreneur"
         redirect_to current_user
      end
   end
end
