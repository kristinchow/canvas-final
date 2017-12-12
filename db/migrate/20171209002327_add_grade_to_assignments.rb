# no doc
class AddGradeToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_reference :assignments, :grade, foreign_key: true
  end
end
