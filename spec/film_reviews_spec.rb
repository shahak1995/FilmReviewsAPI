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

    it 'should return a boolean from has_more' do
      expect(@review.retrieve_has_more).to eq(true) | eq(false)
    end

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

    it 'should return all of the publication dates from publication_date to be String' do
      @review.retrieve_publication_date.each do |pubdate|
        expect(pubdate).to be_kind_of(String)
      end
    end

    it 'should return all of the opening dates from opening_date to be String' do
      @review.retrieve_opening_date.each do |opening|
        expect(opening).to be_kind_of(String)
      end
    end

    it 'should return all of the updated dates from date_updated to be String' do
      @review.retrieve_date_updated.each do |dateupdated|
        expect(dateupdated).to be_kind_of(String)
      end
    end

    it 'should return all of the links from link to be Hash' do
      @review.retrieve_link.each do |l|
        expect(l).to be_kind_of(Hash)
      end
    end

    it 'should return all of the types from the link hash to be String' do
      @review.retrieve_link_type.each do |type|
        expect(type).to be_kind_of(String)
      end
    end

    it 'should return all of the url from the link hash to be String' do
      @review.retrieve_link_url.each do |url|
        expect(url).to be_kind_of(String)
      end
    end

    it 'should return all of the suggested link text from the link hash to be String' do
      @review.retrieve_link_suggested_link_text.each do |text|
        expect(text).to be_kind_of(String)
      end
    end

    it 'should return all of the multimedia to be null' do
      @review.retrieve_multimedia.each do |media|
        expect(media).to be(nil)
      end
    end
  end
end
