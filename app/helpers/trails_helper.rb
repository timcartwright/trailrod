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

module TrailsHelper
  def show_trail_bg
    "background: url('http://get-muddy.com/wp-content/uploads/2014/12/crossingstream1.jpg') no-repeat top center;"
  end

  def in_rodrigues?(location)
    location == "Rodrigues"
  end
end
