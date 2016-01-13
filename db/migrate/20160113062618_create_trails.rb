class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :date
      t.string :external_link
      t.boolean :register_online
      t.string :organiser
      t.string :course

      t.timestamps null: false
    end
  end
end
