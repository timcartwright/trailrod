# == Schema Information
#
# Table name: event_registrations
#
#  id             :integer          not null, primary key
#  event_id       :integer
#  profile_id     :integer
#  paid           :boolean
#  amount         :decimal(, )
#  currency       :string
#  payment_date   :datetime
#  payment_method :string
#  transaction_id :string
#  race_number    :integer
#  race_category  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :profile

  validates :event_id, :profile_id, presence: true

  validate :cannot_register_more_than_once_per_trail

  comma do
    event :distance
    profile :first_name             
    profile :family_name            
    profile :date_of_birth        
    profile :email                  
    profile :mobile                 
    profile :gender                 
    profile :nationality            
    profile :country_of_residence   
    profile :passport_number        
    profile :tshirt_size            
    profile :emergency_contact_name 
    profile :emergency_contact_phone
    paid
  end

private
  def cannot_register_more_than_once_per_trail
    related_events = self.event.related_events.map(&:id)
    errors.add(:event_id, "is duplicate") if EventRegistration.find_by(event_id: related_events, profile_id: profile_id)
  end
end
