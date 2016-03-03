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
  has_attached_file :results,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

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

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
end
