class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :family_name
      t.date :date_of_birth
      t.string :email
      t.string :mobile
      t.string :gender
      t.string :nationality
      t.string :country_of_residence
      t.string :passport_number
      t.string :tshirt_size
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.boolean :accepted_terms
      t.boolean :member_of_rta
      t.integer :rta_number, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
