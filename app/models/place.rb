class Place < ActiveRecord::Base

	belongs_to :owner, :class_name => "User"
	has_many :reservations
	has_many :users, through: :reservations
	has_many :reviews

	has_many :pictures, :dependent => :destroy

	

	def self.search(query)
  		where("state like ?", "%#{query}%") 
	end
	
end



