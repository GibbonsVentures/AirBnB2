class Picture < ActiveRecord::Base
	belongs_to :place

	
	#validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :image, presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
	 has_attached_file :image, 
            :style => { :medium => "300x300>", :thumb => "100x100>" },
            :storage => :s3,
            :bucket  => ENV['AWS_BUCKET'],
            :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                },


end
