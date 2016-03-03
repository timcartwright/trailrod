class AddAttachmentResultsToTrails < ActiveRecord::Migration
  def self.up
    change_table :trails do |t|
      t.attachment :results
    end
  end

  def self.down
    remove_attachment :trails, :results
  end
end
