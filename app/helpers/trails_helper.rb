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
    "background: url('http://get-muddy.com/wp-content/uploads/2014/12/crossingstream1.jpg') no-repeat top center;"
  end
end
