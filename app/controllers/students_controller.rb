class StudentsController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  require 'will_paginate/array'

  def new
   if !current_user
      @user = Student.new
      store_location
   else
      redirect_to current_user
   end
  end

  def profile
     @user = current_user
  end

  def following
     store_location
     @user = current_user
     @startups=@user.followees(Startup).paginate(:page => params[:page], :per_page => 9)
  end

  def all
    #@students=Student.paginate(page: params[:page])
    @search = Search.new(:student, params[:search])
    @search.order = 'lname'
    @students = (@search.run).paginate(:page => params[:page], :per_page => 9)
  end

  def show
    @user = Student.find(params[:id])
    @microposts = Micropost.paginate(page: params[:page])
    store_location
    @search = Search.new(:startup, params[:search])
    @search.order = 'name'
    @startups = (@search.run).paginate(:page => params[:page], :per_page => 9)
  end

  def edit
    $purpose="Edit"
    @user = Student.find(params[:id])
  end

  def updatepwd
    $purpose="Pwd"
    @user = current_user
  end

  def create
    @student = Student.new(user_params)
    if @student.save
      @user=Users.new
      #Handle a successful save.
      if lcurrent_user
         @string=lcurrent_user['siteStandardProfileRequest']['url'].scan(/id=+(\d+)/)[0][0]
         @student.update_attribute(:linkedin_id,@string)
         @user.update_attribute(:linkedin_id,@string)
      end
      @user.update_attribute(:email,@student.email)   
      @user.update_attribute(:type,"Student")
      @user.save
      sign_in(@student,"Student")
      flash[:success] = "Welcome to SIS! Update your profile for better opportunities. Stay tuned for startup entries."
      redirect_to @student
    else
      @user=@student
      render 'new'
      #redirect_to "/students/new"
    end
  end


  def update
    @user = Student.find(params[:id])
    #params[:student].delete(:password) if params[:student][:password].blank?
    if @user.update_attributes(edit_user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      if $purpose=="Edit"
         render 'edit'
      else
         render 'updatepwd'
      end    
    end
  end

  private

    def user_params
      params.require(:student).permit(:fname, :lname, :email,:password,:password_confirmation)
    end

    def edit_user_params
      params.require(:student).permit(:fname, :lname, :email,:skills,:bio,:google,:fb,:github,:pic,:password,:password_confirmation,:education,:linkedin,:phone,:resume)
    end

end
