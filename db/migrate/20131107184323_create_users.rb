class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :linkedin_id
      t.string :type

      t.timestamps
    end
  end
end
