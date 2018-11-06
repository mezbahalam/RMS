class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :vacancy
      t.text :job_description, null: false
      t.text :responsibilities
      t.string :employment_status, null: false
      t.text :edu_requirement
      t.text :exp_requirement, null: false, numerically: true
      t.string :location
      t.integer :remuneration, null: false, numerically: true
      t.text :benefits
      t.date :date_issue
      t.date :deadline
      t.string :job_status, null: false
      t.text :employer_notice

      t.timestamps
    end
  end
end