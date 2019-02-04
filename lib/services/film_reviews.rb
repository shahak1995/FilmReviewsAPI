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

  def retrieve_has_more
    @latest_film_data['has_more']
  end 

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

  def retrieve_publication_date
    publication_date = []
    retrieve_results.each do |pubdate|
      publication_date << pubdate['publication_date']
    end 
    publication_date
  end

  def retrieve_opening_date
    opening_date = []
    retrieve_results.each do |opening|
      opening_date << opening['opening_date']
    end 
    opening_date
  end

  def retrieve_date_updated
    date_updated = []
    retrieve_results.each do |dateupdated|
      date_updated << dateupdated['date_updated']
    end 
    date_updated
  end

  def retrieve_link
    link = []
    retrieve_results.each do |l|
      link << l['link']
    end 
    link
  end

  def retrieve_link_type
    link_type = []
    retrieve_link.each do |type|
      link_type << type['type']
    end 
    link_type
  end

  def retrieve_link_url
    link_url = []
    retrieve_link.each do |url|
      link_url << url['url']
    end 
    link_url
  end

  def retrieve_link_suggested_link_text
    link_suggested_link_text = []
    retrieve_link.each do |text|
      link_suggested_link_text << text['suggested_link_text']
    end 
    link_suggested_link_text
  end

  def retrieve_multimedia
    multimedia = []
    retrieve_results.each do |media|
      multimedia << media['multimedia']
    end 
    multimedia
  end
end 


