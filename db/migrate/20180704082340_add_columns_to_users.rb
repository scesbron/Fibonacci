class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_number, :string
    add_column :users, :street_name, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :situation, :integer
    add_column :users, :pdl, :string
    add_column :users, :state, :integer
  end
end
