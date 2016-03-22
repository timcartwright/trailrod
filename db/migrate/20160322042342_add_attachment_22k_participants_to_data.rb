class AddAttachment22kParticipantsToData < ActiveRecord::Migration
  def self.up
    change_table :data do |t|
      t.attachment :participants_22k
    end
  end

  def self.down
    remove_attachment :data, :participants_22k
  end
end
