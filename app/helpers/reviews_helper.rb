module ReviewsHelper

	def star_rating(rating)
		return rating if rating.class == String
		("★" * rating) +  "☆" * (5 - rating)
	end
end

def created(time)
	elapsed = ( (Time.now - time)/60 ).round
	if elapsed < 60 
		num, unit = elapsed.to_s, 'minutes'
	elsif 60 < elapsed < 3600
		num, unit = (elapsed/60).to_s, 'hours'
	else
		num, unit = (elapsed/1440).to_s, 'days'
	end
	return "#{num} #{unit} ago"

end