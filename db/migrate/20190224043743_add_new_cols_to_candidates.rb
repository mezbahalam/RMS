class AddNewColsToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :language_prof, :text
    add_column :candidates, :award_certificate, :text
    add_column :candidates, :career_objective, :text
    add_column :candidates, :project_url, :text
  end
end
