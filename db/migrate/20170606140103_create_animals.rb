class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.text :name, null: false
      t.text :species, null: false
      t.text :color, null: false
      t.references :tank, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
