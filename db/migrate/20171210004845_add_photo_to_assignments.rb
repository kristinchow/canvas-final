# no doc
class AddPhotoToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_reference :assignments, :photo, foreign_key: true
  end
end
