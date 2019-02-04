require 'spec_helper'

describe 'Latest film reviews' do

  context 'test film reviews by name' do

    before(:all) do
      @review = Reviews.new.filmReviews
      @review.retrieve_film_reviews('avengers')
    end

    it 'should return a hash when getting the data' do
      expect(@review.print_all_film_reviews).to be_kind_of(Hash)
    end
  end
end