require 'rails_helper'

describe 'Users' do

	context 'Manipulating the database' do

		before(:each) do
			Restaurant.create(name: 'Artisam',
												cuisine: 'Titilating grub from the Orient')

		end


		it 'can add a restaurant' do
			visit '/restaurants'
			expect(Restaurant.count).to eq 1
			click_link 'Add a new restaurant'
			fill_in 'name', :with => "The Nag's Head"
			fill_in 'cuisine', :with => "Slime"
			click_button 'Submit new restaurant'
			expect(Restaurant.count).to eq 2
			expect(page).to have_content "The Nag's Head"
		end

		it 'can view an individual restaurant' do
			visit '/restaurants'
			click_link 'Artisam'
			expect(page).to have_content 'Titilating grub from the Orient'
		end

		it 'can edit an existing restaurant' do
			visit '/restaurants'
			click_link 'Artisam'
			click_link 'Edit'
			fill_in 'name', :with => 'peng'
			fill_in 'cuisine', :with => 'yo'
			click_button 'Submit changes'
			expect(Restaurant.find_or_create_by(name: 'peng').cuisine).to eq 'yo'
			expect(page).to have_content 'peng'
		end

		it 'can delete a restaurant' do
			visit '/restaurants'
			click_link 'Artisam'
			click_link 'Delete'
			expect(Restaurant.count).to eq 0
			expect(page).to have_content 'Add a new restaurant'
		end


	end

end