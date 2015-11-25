class AddDetailsToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :location, :string
    add_column :startups, :funding, :string
    add_column :startups, :email, :string
    add_column :startups, :phone, :string
    add_column :startups, :size, :string
    add_column :startups, :tagline, :string
  end
end
