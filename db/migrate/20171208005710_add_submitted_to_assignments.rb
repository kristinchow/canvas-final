# no doc
class AddSubmittedToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :submitted, :boolean
  end
end
