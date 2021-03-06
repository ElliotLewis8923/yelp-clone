require 'rails_helper'

describe 'endorsing reviews' do 
	before do
		pizzapizza = Restaurant.create(:name => 'pizzapizza', :cuisine => 'sludge')
		pizzapizza.reviews.create(rating: 3, text: 'meh')
	end

	it 'can endorse a review updating the review endorsement count' do
		visit '/restaurants'
		click_link 'pizzapizza'
		click_link 'Endorse this review'
		expect(page).to have_content '1 endorsement'
	end
end