class Place < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :reviews

	has_many :pictures, :dependent => :destroy
	
	
	

	

	def self.search(query)
  		where("state like ?", "%#{query}%") 
	end
	
end