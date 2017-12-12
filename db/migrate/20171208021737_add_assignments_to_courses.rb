# no doc
class AddAssignmentsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :assignment, foreign_key: true
  end
end
