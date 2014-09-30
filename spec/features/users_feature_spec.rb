require 'rails_helper'

describe 'Users' do

	context 'adding a restaurant' do

		it 'can add a restaurant' do
			visit '/restaurants'
			click_link 'Add a new restaurant'
			fill_in 'name', :with => "The Nag's Head"
			fill_in 'cuisine', :with => "Slime"
			click_button 'Submit new restaurant'
			expect(page).to have_content "The Nag's Head"
			expect(Restaurant.count).to eq 1
		end

		it 'can view an individual restaurant' do
			Restaurant.create(name: 'Benets',
												cuisine: 'Tasty snax')
			visit '/restaurants'
			click_link 'Benets'
			expect(page).to have_content 'Tasty snax'
		end

		it 'can edit an existing restaurant' do
			Restaurant.create(name: 'Artisam',
												cuisine: 'Titilating grub from the Orient')
			visit '/restaurants'
			click_link 'Artisam'
			click_link 'Edit'
			fill_in 'name', :with => 'peng'
			fill_in 'cuisine', :with => 'yo'
			click_button 'Submit changes'
			expect(Restaurant.find_or_create_by(name: 'peng').cuisine).to eq 'yo'
		end



	end

end