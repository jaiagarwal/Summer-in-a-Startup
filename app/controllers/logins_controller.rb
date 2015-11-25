class LoginsController < ApplicationController
  helper_method :lcurrent_user

  def home
     if current_user
        redirect_to current_user
     end
  end

  def show
   if lcurrent_user
   @string=lcurrent_user['siteStandardProfileRequest']['url'].scan(/id=+(\d+)/)[0][0]
   if !@user=Users.find_by(linkedin_id: @string)
      reset_session
      flash[:alert] = "Please sign up first"
      redirect_to "/"
   elsif @user.type=="Student"
      @student=Student.find_by(linkedin_id: @string)
      sign_in(@student,"Student")
      redirect_to @student
   elsif @user.type=="Entrepreneur"
      @entrepreneur=Entrepreneur.find_by(linkedin_id: @string)
      sign_in(@entrepreneur,"Entrepreneur")
      redirect_to @entrepreneur 
   end
     elsif signed_in?
      redirect_to current_user
   end
  end

  def create
    request_token = consumer.get_request_token(:oauth_callback => callback_login_url)
    Rails.cache.write(request_token.token, request_token.secret)
    redirect_to request_token.authorize_url
  end

  def callback
    request_token = OAuth::RequestToken.new(consumer, params[:oauth_token], Rails.cache.read(params[:oauth_token]))
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    session[:access_token] = access_token.token
    session[:access_token_secret] = access_token.secret
    redirect_back_or "/login"
  end

  def logout
    sign_out
    reset_session
    redirect_to "/"
  end

  private
  CONSUMER_KEY = {
    :key => "efh3x5xkpxq0",
    :secret => "BWA2xEepmqKzhBfC"
  }
  CONSUMER_OPTIONS = { :site => 'https://api.linkedin.com',
                     :authorize_path => '/uas/oauth/authorize',
                     :request_token_path => '/uas/oauth/requestToken',
                     :access_token_path => '/uas/oauth/accessToken',
 :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline"] }

  def consumer
    @consumer ||= OAuth::Consumer.new( CONSUMER_KEY[:key], CONSUMER_KEY[:secret], CONSUMER_OPTIONS)
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth::AccessToken.new(consumer, session[:access_token], session[:access_token_secret])
    end
  end

  def lcurrent_user
    if access_token
      @lcurrent_user ||= JSON.parse(access_token.get('http://api.linkedin.com/v1/people/~', 'x-li-format' => 'json').body)
      # Pick some fields
      #fields = ['first-name', 'last-name', 'headline', 'industry', 'num-connections','email-address'].join(',')

      # Make a request for JSON data
      #json_txt = access_token.get("http://api.linkedin.com/v1/people/~:(#{fields})", 'x-li-format' => 'json').body
      #@current_user ||= JSON.parse(json_txt)
    end
    @lcurrent_user
  end
end
