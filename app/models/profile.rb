# == Schema Information
#
# Table name: profiles
#
#  id                      :integer          not null, primary key
#  first_name              :string
#  family_name             :string
#  date_of_birth           :date
#  email                   :string
#  mobile                  :string
#  gender                  :string
#  nationality             :string
#  country_of_residence    :string
#  passport_number         :string
#  tshirt_size             :string
#  emergency_contact_name  :string
#  emergency_contact_phone :string
#  accepted_terms          :boolean
#  member_of_rta           :boolean
#  rta_number              :integer
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :registrations, class_name: EventRegistration.name
  has_many :events, through: :registrations

  validates :user_id, uniqueness: true, allow_nil: true

  def full_name
    "#{first_name} #{family_name}"
  end

  def is_registered?(event)
    self.events.include?(event)
  end
end
