class AddPasswordDigestToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :password_digest, :string
  end
end
