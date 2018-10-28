class CreateCandidates < ActiveRecord::Migration[5.2]
  def up
    create_table :candidates do |t|
      t.string :name, null: false
      t.integer :gender
      t.date :dob
      t.string :email, null: false
      t.string :contact
      t.text :address
      t.text :skill, null: false
      t.text :experience, null: false
      t.text :hobbies
      t.text :long_term_plan
      t.text :personal_interest, null: false
      t.string :keywords
      t.string :referrals
      t.timestamps
    end
  end

  def down
    drop_table :candidates
  end
end
