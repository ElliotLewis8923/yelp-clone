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
										text: 'meh',
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
			visit '/restaurants'
			click_link 'The Badger'
			click_link 'Add a review'
			fill_in 'text', :with => 'shit is wack yo'
			select 1, :from => 'review_rating'
			click_button 'Submit your review'
			expect(@restaurant.reviews.count).to eq 1
			expect(page).to have_content 'shit is wack yo'
		end


	end




	
end