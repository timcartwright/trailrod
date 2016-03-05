class AddArrivalToEvent < ActiveRecord::Migration
  def change
    add_column :events, :arrival, :string
  end
end
