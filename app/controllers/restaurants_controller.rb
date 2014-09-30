class RestaurantsController < ApplicationController
	
	skip_before_filter :verify_authenticity_token, :only => :create

	def index
		@restaurants = Restaurant.all
	end

	def new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.save
		redirect_to '/restaurants'
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])


		if @restaurant.update(restaurant_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	private
		def restaurant_params
			params.require(:restaurant).permit(:name, :cuisine)
		end

end
