require 'spec_helper'

describe 'Latest film reviews' do

  context 'test film reviews by name' do

    before(:all) do
      @review = Reviews.new.filmReviews
      @review.retrieve_film_reviews('avengers')
    end

    it 'should return a hash when getting the API data' do
      expect(@review.retrieve_film_results).to be_kind_of(Hash)
    end

    it 'should return a string from status' do
      expect(@review.retrieve_status).to be_kind_of(String)
    end

    it 'should return a string from copyright' do
      expect(@review.retrieve_copyright).to be_kind_of(String)
    end

    # it 'should return a boolean from has_more' do
    #   expect(@review.retrieve_has_more).to be equal 'false,'
    # end

    it 'should return a integer from num_results' do
      expect(@review.retrieve_num_results).to be_kind_of(Integer)
    end

    it 'should return a array from results' do
      expect(@review.retrieve_results).to be_kind_of(Array)
    end

    it 'should return all of the film titles from display results to be string' do
      @review.retrieve_all_display_title.each do |title|
        expect(title).to be_kind_of(String)
      end
    end

    it 'should return all of the age ratings from mpaa_rating to be string' do
      @review.retrieve_mpaa_rating.each do |rating|
        expect(rating).to be_kind_of(String)
      end
    end
 
    it 'should return all of the critics pick from critics pick to be Integer' do
      @review.retrieve_critics_pick.each do |pick|
        expect(pick).to be_kind_of(Integer)
      end
    end

    it 'should return all of the bylines from byline to be String' do
      @review.retrieve_byline.each do |line|
        expect(line).to be_kind_of(String)
      end
    end

    it 'should return all of the headlines from headline to be String' do
      @review.retrieve_headline.each do |head|
        expect(head).to be_kind_of(String)
      end
    end

    it 'should return all of the short summaries from summary_short to be String' do
      @review.retrieve_summary_short.each do |short|
        expect(short).to be_kind_of(String)
      end
    end
  end
end
