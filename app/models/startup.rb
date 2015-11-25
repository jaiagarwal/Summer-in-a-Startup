class Startup < ActiveRecord::Base
    belongs_to :entrepreneur
    has_many :microposts, dependent: :destroy
    validates :name, presence: true, length: { maximum: 40 }
    validates :about, presence: true
    validates :entrepreneur_id, presence: true
    validates :founderinfo, presence: true
    acts_as_followable              
    has_attached_file :pic, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }
end
