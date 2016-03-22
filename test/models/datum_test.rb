# == Schema Information
#
# Table name: data
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  participants_44k_file_name    :string
#  participants_44k_content_type :string
#  participants_44k_file_size    :integer
#  participants_44k_updated_at   :datetime
#  participants_22k_file_name    :string
#  participants_22k_content_type :string
#  participants_22k_file_size    :integer
#  participants_22k_updated_at   :datetime
#  participants_7k_file_name     :string
#  participants_7k_content_type  :string
#  participants_7k_file_size     :integer
#  participants_7k_updated_at    :datetime
#

require 'test_helper'

class DatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
