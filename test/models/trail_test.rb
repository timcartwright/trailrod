# == Schema Information
#
# Table name: trails
#
#  id                   :integer          not null, primary key
#  name                 :string
#  description          :text
#  location             :string
#  date                 :datetime
#  external_link        :string
#  register_online      :boolean
#  organiser            :string
#  course               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  results_file_name    :string
#  results_content_type :string
#  results_file_size    :integer
#  results_updated_at   :datetime
#

require 'test_helper'

class TrailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
