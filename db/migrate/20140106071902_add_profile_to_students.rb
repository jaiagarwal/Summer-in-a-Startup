class AddProfileToStudents < ActiveRecord::Migration
  def change
    add_column :students, :bio, :text
    add_column :students, :google, :string
    add_column :students, :fb, :string
    add_column :students, :github, :string
    add_column :students, :skills, :string
  end
end
