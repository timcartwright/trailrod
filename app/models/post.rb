class Post < ActiveRecord::Base

  has_attached_file :image,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image, content_type: ['image/png', 'image/jpg']

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
  
end
