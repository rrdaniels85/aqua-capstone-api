class CreateTanks < ActiveRecord::Migration[5.0]
  def change
    create_table :tanks do |t|
      t.text :name, null: false
      t.text :type, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
