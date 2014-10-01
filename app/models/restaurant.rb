class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
	validates :cuisine, presence: true

	def average_rating
		if self.reviews.any?
			memo = self.reviews.to_ary.inject(0) { |m, v| m + v.rating }
			memo / self.reviews.count.to_f
		else
			"Nobody has reviewed this restaurant yet."
		end
	end
			


end
