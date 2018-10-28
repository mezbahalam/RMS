class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :job_description
      t.text :responsibilities
      t.text :requirements
      t.text :remuneration
      t.text :location
      t.date :deadline
      t.date :date_issue
      t.string :status

      t.timestamps
    end
  end
end
