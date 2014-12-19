module SessionsHelper
   def sign_in(user,type)
    $type=type
    if type=="Student"
       remember_token = Student.new_remember_token
       cookies.permanent[:remember_token] = remember_token
       user.update_attribute(:remember_token, Student.encrypt(remember_token))
       self.current_user = user
    else
       remember_token = Entrepreneur.new_remember_token
       cookies.permanent[:remember_token] = remember_token
       user.update_attribute(:remember_token, Entrepreneur.encrypt(remember_token))
       self.current_user = user     
    end
   end
      
   def signed_in?
    !current_user.nil?
   end

   def current_user=(user)
    @current_user = user
   end

   def current_user
    if $type=="Entrepreneur"
    remember_token = Entrepreneur.encrypt(cookies[:remember_token])
    @current_user ||= Entrepreneur.find_by(remember_token: remember_token)
    else
    remember_token = Student.encrypt(cookies[:remember_token])
    @current_user ||= Student.find_by(remember_token: remember_token)
    end 
   end

   def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
   end
 
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def signed_in_user
      unless signed_in?
        store_location
        redirect_to "/login"
        flash[:alert]="Please sign in"
      end
  end

  def correct_user
    if $type=="Entrepreneur"
      @user = Entrepreneur.find(params[:id])
    else 
      @user = Student.find(params[:id])
    end
      redirect_to(root_url) unless current_user==@user
  end

  def user_type
  $type
  end


end
