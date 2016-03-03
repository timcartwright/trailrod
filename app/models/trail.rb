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

class Trail < ActiveRecord::Base
  has_many :events
  has_attached_file :results

  validates :name, :date, :organiser, :description, presence: true
  validates_attachment_content_type :results, content_type: ['application/pdf']


  def is_finished?
    self.date < DateTime.now
  end

  def results_posted?
    self.results_file_name
  end

  def slug
    name.downcase.gsub(" ", "-")  
  end

  def to_param
    "#{id}-#{slug}"
  end
end
