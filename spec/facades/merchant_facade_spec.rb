require 'rails_helper'

RSpec.describe 'MerchantFacade' do
  describe 'index page calls' do
    it 'returns all merchants names as links', :vcr do
      results = MerchantFacade  # set to variable to decrease number of api and/or cassette calls
                .expect(results).to be_a Array
      expect(results.count).to be <= 40
      expect(results).to be_all Merchant
    end

    it 'key word search returns an array of up to 40 movie hashes with keyword in the title', :vcr do
      keyword = 'Home'
      results = MoviesFacade.search(keyword)  # set to variable to decrease number of api and/or cassette calls
      expect(results).to be_a Array
      expect(results.sample.title).to include('Home')
      expect(results.count).to be <= 40
    end
  end

  describe 'movie detail page facade', :vcr do
    it 'can return a movie object using id' do
      id = 18
      expect(MoviesFacade.movie(id).title).to eq('The Fifth Element')
    end

    it 'can return an array of movie reviews', :vcr do
      movie_id = 18
      expect(MoviesFacade.movie_reviews(movie_id)).to be_a Array
    end

    it 'can return an array of 10 cast members', :vcr do
      movie_id = 550
      expect(MoviesFacade.ten_movie_cast(movie_id)).to be_a Array
      expect(MoviesFacade.ten_movie_cast(movie_id)[0].name).to eq('Edward Norton')
      expect(MoviesFacade.ten_movie_cast(movie_id)[1].name).to eq('Brad Pitt')
    end
  end
end
