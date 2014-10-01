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

		context '#created' do

			it "displays minutes elapsed if created within the hour" do
				time = Time.now - 3000
				expect(created(time)).to eq '50 minutes ago'
			end

			it "displays hours elapsed if created longer than an hour ago" do
				time = Time.now - 4000
				expect(created(time)).to eq '1 hour ago'
			end

		end
end