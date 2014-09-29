require 'rails_helper'

describe 'Users' do

	context 'adding a restaurant' do

		it 'can add a restaurant' do
			visit '/restaurants'
			click_link 'Add a new restaurant'
			fill_in 'name', :with => "The Nag's Head"
			fill_in 'cuisine', :with => "Slime"
			click_button 'submit'
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

	end

end