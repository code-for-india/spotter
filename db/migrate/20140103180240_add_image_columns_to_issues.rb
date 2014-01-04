class AddImageColumnsToIssues < ActiveRecord::Migration
  def change
    add_attachment :issues, :image
  end
end
