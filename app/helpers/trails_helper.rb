# == Schema Information
#
# Table name: trails
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  location        :string
#  date            :datetime
#  external_link   :string
#  register_online :boolean
#  organiser       :string
#  course          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module TrailsHelper
  def show_trail_bg
    "background-image: url('http://get-muddy.com/wp-content/uploads/2014/12/crossingstream1.jpg');"
  end
end
