class AddAttachment7kParticipantsToData < ActiveRecord::Migration
  def self.up
    change_table :data do |t|
      t.attachment :participants_7k
    end
  end

  def self.down
    remove_attachment :data, :participants_7k
  end
end
