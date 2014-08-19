class ReviewsController < ApplicationController




	def create
		@review = Review.create(reviews_params)
		@review.user_id = current_user.id
		if @review.save
			flash[:notice] = "Thanks for the review"
		else
			flash[:error] = "You messed it up dumbo"
		end
		redirect_to root_path
	end

	private

	def reviews_params
		params.require(:review).permit(:place_id, :user_id, :review)
	end
end
