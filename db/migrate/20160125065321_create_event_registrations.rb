class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.references :event, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.boolean :paid
      t.decimal :amount
      t.string :currency
      t.datetime :payment_date
      t.string :payment_method
      t.string :transaction_id
      t.integer :race_number
      t.string :race_category

      t.timestamps null: false
    end
  end
end
