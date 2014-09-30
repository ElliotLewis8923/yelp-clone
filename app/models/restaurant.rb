class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
	validates :cuisine, presence: true

	def average_rating
		if self.reviews.count > 0
			@memo = 0
			self.reviews.to_ary.each { |r| @memo += r.rating }
			@memo / self.reviews.count.to_f
		else
			"Nobody has reviewed this restaurant yet."
		end
	end
			


end
