class AddColumnsIntoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :middlename, :string
    add_column :users, :lastname, :string
    add_column :users, :contact, :string
    add_column :users, :address, :text
    add_column :users, :dob, :date
    add_column :users, :country, :string
  end
end
