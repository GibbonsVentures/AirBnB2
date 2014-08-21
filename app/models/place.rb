class Place < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :reviews

	has_many :pictures, :dependent => :destroy
	
	
	

	validates_presence_of :kind, :address, :state, :description, :price, :availability

	def self.search(query)
  		where("state like ?", "%#{query}%") 
	end
	
end