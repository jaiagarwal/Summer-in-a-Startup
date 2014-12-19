class Entrepreneur < ActiveRecord::Base
   has_many :startups, dependent: :destroy
   before_save { self.email = email.downcase }
   validates :fname, presence: true, length: { maximum: 20 }
   validates :lname, presence: true, length: { maximum: 20 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   has_secure_password
   validates :password, length: { minimum: 6 }
   has_attached_file :pic, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }

   def Entrepreneur.new_remember_token
    SecureRandom.urlsafe_base64
   end

   def Entrepreneur.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
   end

  private

   def create_remember_token
     self.remember_token = Entrepreneur.encrypt(Entrepreneur.new_remember_token)
   end
end
