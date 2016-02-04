# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  distance          :integer
#  local_price       :integer
#  foreign_price     :integer
#  registration_open :boolean
#  trail_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :trail
  has_many :registrations, class_name: EventRegistration.name
  has_many :participants, through: :registrations, source: :profile

  validates :distance, presence: true

  def register(trailer)
    registration = self.registrations.new
    registration.profile = trailer
    registration.save
  end

  def related_events
    self.trail.events
  end

end
