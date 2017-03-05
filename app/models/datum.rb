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
#  participants_12k_file_name    :string
#  participants_12k_content_type :string
#  participants_12k_file_size    :integer
#  participants_12k_updated_at   :datetime
#  participants_7k_file_name     :string
#  participants_7k_content_type  :string
#  participants_7k_file_size     :integer
#  participants_7k_updated_at    :datetime
#

class Datum < ActiveRecord::Base

  attr_accessor :"delete_#{name}"

  has_attached_file :participants_44k,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  has_attached_file :participants_22k,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  has_attached_file :participants_12k,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  has_attached_file :participants_7k,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :participants_44k, content_type: ['application/pdf']
  validates_attachment_content_type :participants_22k, content_type: ['application/pdf']
  validates_attachment_content_type :participants_12k, content_type: ['application/pdf']
  validates_attachment_content_type :participants_7k, content_type: ['application/pdf']

  include DeletableAttachment

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
end
