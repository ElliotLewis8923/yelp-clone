require 'rails_helper'

describe 'Reviews' do 

	context 'creation' do

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
										text: 'wow',
										rating: 3)
			expect(@restaurant.reviews).not_to eq nil
		end
	end

	context 'users' do

		before(:each) do
			@restaurant = Restaurant.create(name: 'The Badger',
																			cuisine: 'Pub food')
		end

		it 'can leave a review for a restaurant' do
			write_review_for('The Badger', 3)
			expect(@restaurant.reviews.count).to eq 1
			expect(page).to have_content 'shit'
		end


	end





	
end