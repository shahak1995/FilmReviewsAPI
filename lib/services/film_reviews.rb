require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load('.env')

class FilmReviews

  include HTTParty

  base_uri 'https://api.nytimes.com'
  
  def retrieve_film_reviews(film_name)
    api_key = ENV['REVIEW_API_KEY']
    @latest_film_reviews = JSON.parse(self.class.get("/svc/movies/v2/reviews/search.json?query=#{film_name}&api-key=#{api_key}").body)
  end 

  def print_all_film_reviews
    @latest_film_reviews
  end 
end 

test = FilmReviews.new
test.retrieve_film_reviews('Goodfellas')
p test.print_all_film_reviews