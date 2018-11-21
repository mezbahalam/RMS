class AddUserRefToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidates, :user, index: true, unique: true, foreign_key: true
  end
end
