require 'rails_helper'

describe 'Reviews' do 


	context 'users' do

		before(:each) do
			@restaurant = Restaurant.create(name: 'The Badger',
																			cuisine: 'Pub food')
		end

		it 'can leave a review for a restaurant' do
			write_review_for('The Badger', 3)
			expect(page).to have_content 'shit'
		end
	end

		


	context 'display' do
			
		# it 'displays the comment and rating of for a review'
		# 	write_review_for('The Badger', 1)

		# end



	end

	
end