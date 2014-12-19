class Student < ActiveRecord::Base
   before_save { self.email = email.downcase }
   before_create :create_remember_token
   validates :fname, presence: true, length: { maximum: 20 }
   validates :lname, presence: true, length: { maximum: 20 }
   acts_as_follower
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   has_secure_password
   validates :password, length: { minimum: 6 },:confirmation => true, 
                            :if       => :password_changed?
   has_attached_file :pic, :styles => 
          { :medium => "300x300>", :thumb => "100x100>" }
   has_attached_file :resume
   validates_attachment :resume, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

   def Student.new_remember_token
    SecureRandom.urlsafe_base64
   end

   def Student.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
   end

   def password_changed?
    !@password.blank?
   end

  private

   def create_remember_token
     self.remember_token = Student.encrypt(Student.new_remember_token)
   end
end
