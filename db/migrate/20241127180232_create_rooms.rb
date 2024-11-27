class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.references :building, null: false, foreign_key: true
      t.references :floor, null: false, foreign_key: true
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
