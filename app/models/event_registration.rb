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
end
