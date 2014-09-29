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

	context 'restaurants have a name and cuisine' do
		
		before do
			Restaurant.create(name: 'The Possum',
												cuisine: 'Roadkill')
		end

		it 'should display the name and cuisine of the restaurant' do
			visit 'restaurants'
			expect(page).to have_content 'The Possum'
			expect(page).to have_content 'Roadkill'
		end
	end

end