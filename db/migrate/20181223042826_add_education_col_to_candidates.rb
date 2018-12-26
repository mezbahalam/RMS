class AddEducationColToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :university_name, :string
    add_column :candidates, :degree, :string
    add_column :candidates, :major, :string
    add_column :candidates, :cgpa, :float
    add_column :candidates, :passing_year, :string
  end
end
