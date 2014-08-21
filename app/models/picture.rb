class Picture < ActiveRecord::Base
	belongs_to :place

	has_attached_file :image, :styles => { :medium => "300x300>"}

	validates :image, presence: true
	validates_attachment_content_type :image, :content_type => /\Aimage/
	
end
