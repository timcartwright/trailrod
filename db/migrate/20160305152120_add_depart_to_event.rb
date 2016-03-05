class AddDepartToEvent < ActiveRecord::Migration
  def change
    add_column :events, :depart, :string
  end
end
