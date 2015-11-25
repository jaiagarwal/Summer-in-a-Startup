class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :link
      t.text :about
      t.text :founderinfo
      t.integer :entrepreneur_id

      t.timestamps
    end
    add_index :startups, [:entrepreneur_id, :created_at]
  end
end
