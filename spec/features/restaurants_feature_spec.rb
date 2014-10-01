require 'rails_helper'

describe 'Restaurants' do
	
	context 'no restaurants have been added' do
		
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
		end
	end

	context 'are restaurants' do
		
		before do
			Restaurant.create(name: 'McDonalds',
												cuisine: 'Slime')
		end

		it 'should show the restaurant' do
			visit 'restaurants'
			expect(page).to have_content 'McDonalds'
		end
	end


	context 'Users' do

		before(:each) do
			Restaurant.create(name: 'Artisam',
												cuisine: 'Titilating grub from the Orient')
			visit '/restaurants'

		end


		it 'can add a restaurant' do
			click_link 'Add a new restaurant'
			fill_in 'name', :with => "The Nag's Head"
			fill_in 'cuisine', :with => "Slime"
			click_button 'Submit'
			expect(page).to have_content "The Nag's Head"
		end

		it 'can view an individual restaurant, displaying its name and cuisine' do
			click_link 'Artisam'
			expect(page).to have_content 'Artisam Cuisine: Titilating grub from the Orient'
		end

		it 'can edit an existing restaurant' do
			click_link 'Artisam'
			click_link 'Edit'
			fill_in 'name', :with => 'peng'
			fill_in 'cuisine', :with => 'yo'
			click_button 'Submit'
			expect(page).to have_content 'peng'
		end

		it 'can delete a restaurant' do
			click_link 'Artisam'
			click_link 'Delete'
			expect(page).to have_content 'Add a new restaurant'
		end

	end

	context 'display' do

		it 'each restaurant should display an average rating' do
			visit '/restaurants'
			Restaurant.create(name: 'McDonalds',
												cuisine: 'Slime')
			write_review_for('McDonalds', 3)
			write_review_for('McDonalds', 1)
			visit '/restaurants'
			expect(page).to have_content 'Average rating: 2.0'
		end
	end





end