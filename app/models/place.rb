class Place < ActiveRecord::Base
	belongs_to :user
	has_many :reservations

	has_many :pictures, :dependent => :destroy
	accepts_nested_attributes_for :pictures, :allow_destroy => true    

	
	

	validates_presence_of :kind, :address, :state, :description, :price, :availability

	def self.search(query)
  		where("state like ?", "%#{query}%") 
	end
	
end