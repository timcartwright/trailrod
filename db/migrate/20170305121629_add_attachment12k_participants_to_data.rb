class AddAttachment12kParticipantsToData < ActiveRecord::Migration
  def self.up
    change_table :data do |t|
      t.attachment :participants_12k
    end
  end

  def self.down
    remove_attachment :data, :participants_12k
  end
end
