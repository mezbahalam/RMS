class RemoveFieldsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address, :text
    remove_column :users, :contact, :string
    remove_column :users, :dob, :date
  end
end
