class AddDepartureToEvent < ActiveRecord::Migration
  def change
    add_column :events, :departure, :string
  end
end
