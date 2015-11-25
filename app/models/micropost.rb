class Micropost < ActiveRecord::Base
   belongs_to :startup
   default_scope -> { order('created_at DESC') }
   validates :content, presence: true
   validates :startup_id, presence: true
end
