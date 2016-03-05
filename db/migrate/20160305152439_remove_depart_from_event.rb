class RemoveDepartFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :depart, :string
  end
end
