require 'rails_helper'

describe 'restaurants' do
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
		end
	end

	context 'are restaurants' do
		before do
			Restaurant.create(name: 'McDonalds')
		end

		it 'should show the restaurant' do
			visit 'restaurants'
			expect(page).to have_content 'McDonalds'
		end
	end
end