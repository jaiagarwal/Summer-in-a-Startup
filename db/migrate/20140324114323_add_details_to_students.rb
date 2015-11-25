class AddDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :education, :text
    add_column :students, :linkedin, :string
    add_column :students, :phone, :string
  end
end
