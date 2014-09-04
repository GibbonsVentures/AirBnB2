class Reservation < ActiveRecord::Base
	belongs_to :place
	belongs_to :user

	def reject!
    update_attributes({"status" => "rejected"})
  end

  def accept!
    update_attributes({'status'=> 'accepted'})
  end

  def pending?
    status == "pending"
  end


end
