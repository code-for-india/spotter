class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue_type
      t.float :latitude
      t.float :longitude
      t.text :description
      t.text :status

      t.timestamps
    end
  end
end
