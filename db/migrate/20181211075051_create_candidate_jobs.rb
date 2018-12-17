class CreateCandidateJobs < ActiveRecord::Migration[5.2]
  def up
    create_table :candidate_jobs do |t|
      t.integer :candidate_id, foreign_key: true
      t.integer :job_id, foreign_key: true
      t.string :expected_salary
      t.timestamps
    end

    add_index :candidate_jobs, :candidate_id
    add_index :candidate_jobs, :job_id
    add_index :candidate_jobs, [:candidate_id, :job_id], unique: true
  end

  def down
    drop_table :candidate_jobs
  end
end
