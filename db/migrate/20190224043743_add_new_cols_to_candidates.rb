class AddNewColsToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :english_proficiency, :json
    add_column :candidates, :bangla_proficiency, :json
    add_column :candidates, :other_language, :text
    add_column :candidates, :award_certificate, :text
    add_column :candidates, :career_objective, :text
    add_column :candidates, :project_url, :text
  end
end
