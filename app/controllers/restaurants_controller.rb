class RestaurantsController < ApplicationController
	
	skip_before_filter :verify_authenticity_token, :only => :create

	def index
		@restaurants = Restaurant.all
	end

	def new
	end

	def create
		@restaurant = Restaurant.new(article_params)
		@restaurant.save
		redirect_to '/restaurants'
	end

	private
		def article_params
			params.require(:restaurant).permit(:name, :cuisine)
		end
end
