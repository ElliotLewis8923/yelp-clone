class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :rating, numericality: { only_integer: true, less_than: 6, greater_than: 0 }


end
