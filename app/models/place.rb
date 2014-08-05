class Place < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :images

	has_attached_file :image, :styles => { :medium => "300x300>"}
	validates :image, presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

	validates_presence_of :kind, :address, :state, :description, :price, :availability

	def self.search(query)
  		where("state like ?", "%#{query}%") 
	end
	private

		def set_status
			self.status = kind
		end
end