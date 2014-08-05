class Place < ActiveRecord::Base
	belongs_to :user
	has_many :reservations

	validates_presence_of :kind, :address, :state, :description, :price, :availability

	def self.search(query)
  		where("state like ?", "%#{query}%") 
	end
	private

		def set_status
			self.status = kind
		end
end
