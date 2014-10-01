require 'rails_helper'

describe ReviewsHelper, :type => :rails_helper

	 context '#star rating' do

			it 'does nothing when given anything but a number' do
				expect(helper.star_rating('blah')).to eq "blah"
			end

			it 'returns 5 black stars for 5' do
				expect(helper.star_rating(5)).to eq '★★★★★'
			end

			it 'returns 3 black stars and 2 white stars for 3' do
				expect(helper.star_rating(3)).to eq '★★★☆☆'
			end
end