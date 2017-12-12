# no doc
class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.integer :score
      t.integer :points
      t.datetime :duedate

      t.timestamps
    end
  end
end
