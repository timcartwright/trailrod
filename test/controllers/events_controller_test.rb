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

require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
