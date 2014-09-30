require 'rails_helper'

describe 'Reviews' do 

	before(:each) do
		@restaurant = Restaurant.create(name: 'The Badger',
																		cuisine: 'Pub food')
	end

	it 'exists' do
		Review.create(restaurant: @restaurant,
									text: 'meh',
									rating: 3)
		expect(Review.count).to eq 1
	end

	it 'belongs to a restaurant' do
		Review.create(restaurant: @restaurant,
									text: 'meh',
									rating: 3)
		expect(@restaurant.reviews).not_to eq nil
	end

	
end