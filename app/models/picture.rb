class Picture < ActiveRecord::Base
	belongs_to :place

	has_attached_file :image, :styles => { :medium => "300x300>"}

	validates :image, presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
