class RestaurantsController < ApplicationController
	
	skip_before_filter :verify_authenticity_token, :only => :create

	def index
		@restaurants = Restaurant.all
	end

	def new
	end

	def create
		@restaurant = Restaurant.create(name: params[:name], cuisine: params[:cuisine])
		redirect_to '/restaurants'
	end

end
