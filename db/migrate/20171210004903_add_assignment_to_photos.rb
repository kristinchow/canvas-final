# no doc
class AddAssignmentToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :assignment, foreign_key: true
  end
end
