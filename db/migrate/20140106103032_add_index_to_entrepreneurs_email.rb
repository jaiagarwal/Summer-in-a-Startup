class AddIndexToEntrepreneursEmail < ActiveRecord::Migration
  def change
      add_index :entrepreneurs, :email, unique: true
  end
end
