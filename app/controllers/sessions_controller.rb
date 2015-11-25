class SessionsController < ApplicationController
  def new
  end

  def create
    @temp = Users.find_by(email: params[:session][:email].downcase)
    if @temp
	    if @temp.type=="Student"
	       user=Student.find_by(email: params[:session][:email].downcase)
	    elsif @temp.type=="Entrepreneur"
	       user=Entrepreneur.find_by(email: params[:session][:email].downcase)
	    end
	    if user && user.authenticate(params[:session][:password])
	      # Sign the user in and redirect to the user's show page.
	      sign_in(user,@temp.type)
	      redirect_back_or user
	    else
	      flash[:error] = 'Invalid email/password combination'
	      redirect_to "/login"
	    end
   else
            flash[:error] = 'Invalid email/password combination'
	    redirect_to "/login"
   end
  end

  def destroy
   sign_out
   redirect_to root_url
  end
end
