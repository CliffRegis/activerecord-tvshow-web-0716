class Show < ActiveRecord::Base

def self.highest_rating
  Show.maximum(:rating)
end

def self.most_popular_show
	 hig = self.highest_rating
  Show.where("rating > ?", hig)
 
end

def self.lowest_rating

 Show.minimum(:rating)

end

def self.least_popular_show
	 low_num = self.lowest_rating
  Show.all.each do |x|
   if x.rating == low_num
  	return x
  end
 end
end

def self.ratings_sum
	Show.sum(:rating)
end


def self.popular_shows
	arr =[]
  Show.all.each do |x|
   if x.rating > 5
  	arr << x
  end
 end
 arr
end


def self.shows_by_alphabetical_order
	Show.order(:name)
end
#most_popular_show: this method should return the show with the highest rating. hint: use the #highest_rating method as a helper method.
#lowest_rating: returns the lowest value in the ratings column.
#least_popular_show: returns the show with the lowest rating.
#ratings_sum: returns the sum of all of the ratings.
#popular_shows: returns an array of all of the shows that have a rating greater than 5. hint: use the #where method Active Record method.
#shows_by_alphabetical_order: returns an array of all of the shows sorted by alphabetical order according to their names. hint: use the #order Active Record method.
end