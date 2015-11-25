class AddProfilepicStartupsPaperclip < ActiveRecord::Migration
  def change
      add_column :startups, :pic_file_name,    :string
      add_column :startups, :pic_content_type, :string
      add_column :startups, :pic_file_size,    :integer
      add_column :startups, :pic_updated_at,   :datetime
  end

  def self.up
      add_column :startups, :pic_file_name,    :string
      add_column :startups, :pic_content_type, :string
      add_column :startups, :pic_file_size,    :integer
      add_column :startups, :pic_updated_at,   :datetime
  end
  
  def self.down
     remove_column :startups, :pic_file_name
     remove_column :startups, :pic_content_type
     remove_column :startups, :pic_file_size
     remove_column :startups, :pic_updated_at
  end
end
