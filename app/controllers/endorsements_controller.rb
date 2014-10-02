class EndorsementsController < ApplicationController

	def create
		@review = Review.find(params[:review_id])
		@restaurant = @review.restaurant
		@review.endorsements.create
		redirect_to restaurant_path(@restaurant)
	end
end
