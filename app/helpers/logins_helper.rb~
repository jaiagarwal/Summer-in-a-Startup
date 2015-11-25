module LoginsHelper
 
 CONSUMER_KEY = {
    :key => "efh3x5xkpxq0",
    :secret => "BWA2xEepmqKzhBfC"
  }
  CONSUMER_OPTIONS = { :site => 'https://api.linkedin.com',
                     :authorize_path => '/uas/oauth/authorize',
                     :request_token_path => '/uas/oauth/requestToken',
                     :access_token_path => '/uas/oauth/accessToken' }

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
    end
    @lcurrent_user
  end

end
