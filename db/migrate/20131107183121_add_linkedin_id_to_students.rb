class AddLinkedinIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :linkedin_id, :string
  end
end
