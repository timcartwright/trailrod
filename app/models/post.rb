class Post < ActiveRecord::Base

  has_attached_file :image,
                    storage: :s3,
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image, content_type: ['image/png', 'image/jpg']
  validates :title, :body, presence: true

  before_validation :sanitize_content, on: [:create, :update]

private
  def sanitize_content
    self.body = sanitize_tiny_mce(self.body)
  end

  def sanitize_tiny_mce(field)
    ActionController::Base.helpers.sanitize(field,
      :tags => %w(a b i strong em p param h1 h2 h3 h4 h5 h6 br hr ul li img),
      :attributes => %w(href name src type value width height data) );
  end

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end

end
