class AddRememberTokenToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :remember_token, :string
    add_index  :entrepreneurs, :remember_token
  end
end
