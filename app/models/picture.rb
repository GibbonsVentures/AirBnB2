class Picture < ActiveRecord::Base
	belongs_to :place


	
	#validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :image, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
	 


end
