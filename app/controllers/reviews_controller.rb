class ReviewsController < ApplicationController
	before_filter :authenticate_user!

	


	def show
		@review = Review.find(params[:id])
	end

	def create
		@review = Review.new(reviews_params)
		if @review.save
			flash[:notice] = "Thanks for the review"
		else
			flash[:error] = "You messed it up dumbo"
		end
		redirect_to root_path
	end

	private
   

	def reviews_params
		params.require(:review).permit(:place_id, :user_id, :experience)
	end
end
