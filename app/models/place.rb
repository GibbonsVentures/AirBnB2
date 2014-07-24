class Place < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :kind, :address, :state, :description, :price, :availability


	private

		def set_status
			self.status = kind
		end
end
