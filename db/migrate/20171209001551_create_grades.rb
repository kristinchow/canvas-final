# no doc
class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.integer :score
      t.references :assignment, foreign_key: true

      t.timestamps
    end
  end
end
