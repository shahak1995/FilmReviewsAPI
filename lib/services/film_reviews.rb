require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load('.env')

class FilmReviews

  include HTTParty

  base_uri 'https://api.nytimes.com'
  
  def retrieve_film_reviews(film_name)
    api_key = ENV['REVIEW_API_KEY']
    @latest_film_data = JSON.parse(self.class.get("/svc/movies/v2/reviews/search.json?query=#{film_name}&api-key=#{api_key}").body)
  end 

  def retrieve_film_results
    @latest_film_data
  end 

  def retrieve_status
    @latest_film_data['status']
  end 

  def retrieve_copyright
    @latest_film_data['copyright']
  end 

  # def retrieve_has_more
  #   @latest_film_data['has_more']
  # end 

  def retrieve_num_results
    @latest_film_data['num_results']
  end 

  def retrieve_results
    @latest_film_data['results']
  end 

  def retrieve_all_display_title
    display_title = []
    retrieve_results.each do |title|
      display_title << title['display_title']
    end 
    display_title
  end

  def retrieve_mpaa_rating
    mpaa_rating = []
    retrieve_results.each do |rating|
      mpaa_rating << rating['mpaa_rating']
    end 
    mpaa_rating
  end

  def retrieve_critics_pick
    critics_pick = []
    retrieve_results.each do |pick|
      critics_pick << pick['critics_pick']
    end 
    critics_pick
  end

  def retrieve_byline
    byline = []
    retrieve_results.each do |line|
      byline << line['byline']
    end 
    byline
  end

  def retrieve_headline
    headline = []
    retrieve_results.each do |head|
      headline << head['headline']
    end 
    headline
  end

  def retrieve_summary_short
    summary_short = []
    retrieve_results.each do |short|
      summary_short << short['summary_short']
    end 
    summary_short
  end
end 

# test = FilmReviews.new
# test.retrieve_film_reviews('avengers')
# p test.retrieve_mpaa_rating