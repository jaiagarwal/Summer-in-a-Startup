class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table :entrepreneurs do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :linkedin_id

      t.timestamps
    end
  end
end
