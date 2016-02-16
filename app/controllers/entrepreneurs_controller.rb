class EntrepreneursController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update,:show]
  before_action :correct_user,   only: [:edit, :update]
  def new
  if !current_user
     @user = Entrepreneur.new
     store_location
  else
    redirect_to current_user
  end
  end

  def show
    @user = Entrepreneur.find(params[:id])
    @startups = @user.startups.paginate(page: params[:page])
    @microposts = Micropost.paginate(page: params[:page])
    @startups = @user.startups
  end

  def updatepwd
    @user = current_user
  end

  def create
    @entrepreneur = Entrepreneur.new(user_params)    
    if @entrepreneur.save
      # Handle a successful save.
      @user=Users.new
      if lcurrent_user
         @string=lcurrent_user['siteStandardProfileRequest']['url'].scan(/id=+(\d+)/)[0][0]
         @entrepreneur.update_attribute(:linkedin_id,@string)
         @user.update_attribute(:linkedin_id,@string)
      end
      @user.update_attribute(:email,@entrepreneur.email)
      @user.update_attribute(:type,"Entrepreneur")
      @user.save
      sign_in(@entrepreneur,"Entrepreneur")
      flash[:success] = "Make your own startup to reach out to other users"
      redirect_to current_user
    else
      #redirect_back_or "/login"
      @user=@entrepreneur
      render 'new'
    end
  end

  def destroy
    @entrepreneur.destroy
    respond_to do |format|
      format.html { redirect_to entrepreneurs_url }
      format.json { head :no_content }
    end
  end

  def update
    @user = Entrepreneur.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'updatepwd'
    end
  end

  private

    def user_params
      params.require(:entrepreneur).permit(:fname, :lname, :email,:password,:password_confirmation, :pic)
    end
end
