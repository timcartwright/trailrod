class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :distance
      t.integer :local_price
      t.integer :foreign_price
      t.boolean :registration_open
      t.references :trail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
