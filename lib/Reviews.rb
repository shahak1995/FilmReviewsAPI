require_relative './services/film_reviews'

class Reviews
  def filmReviews
    FilmReviews.new
  end
end
