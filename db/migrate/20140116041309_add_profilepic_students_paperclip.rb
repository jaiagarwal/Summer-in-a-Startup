class AddProfilepicStudentsPaperclip < ActiveRecord::Migration
  def change
      add_column :students, :pic_file_name,    :string
      add_column :students, :pic_content_type, :string
      add_column :students, :pic_file_size,    :integer
      add_column :students, :pic_updated_at,   :datetime
  end
end
