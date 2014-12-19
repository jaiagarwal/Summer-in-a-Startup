class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.integer :startup_id

      t.timestamps
    end
    add_index :microposts, [:startup_id, :created_at]
  end
end
