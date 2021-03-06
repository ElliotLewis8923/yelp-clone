class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@restaurant.reviews.create(review_params)
		redirect_to restaurant_path(@restaurant)
	end

	# def edit
	# 	@restaurant = Restaurant.find(params[:restaurant_id])
	# 	@review = @restaurant.reviews.find(params[:id])
	# end

	private
		def review_params
			params.require(:review).permit(:text, :rating)
		end
end
