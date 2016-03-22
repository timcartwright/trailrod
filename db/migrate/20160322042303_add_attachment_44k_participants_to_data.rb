class AddAttachment44kParticipantsToData < ActiveRecord::Migration
  def self.up
    change_table :data do |t|
      t.attachment :participants_44k
    end
  end

  def self.down
    remove_attachment :data, :participants_44k
  end
end
