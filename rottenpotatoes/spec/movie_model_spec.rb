  
require 'rails_helper'

describe Movie do
  describe 'find movies with same director' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Athadu', director: 'Trivakram') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'A Aa', director: 'Trivakram') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "Bahubali", director: 'Rajamouli') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "Dil")}
    let!(:movie5) { FactoryGirl.create(:movie, title: "student", director:"Puri")}
    
    it 'retrieve list of similar movies by director name' do
        expect(Movie.find_movies_of_director(movie1.director).pluck(:title)).to eql(['Athadu', "A Aa"])
        expect(Movie.find_movies_of_director(movie3.director).pluck(:title)).to eql(['Bahubali'])
        expect(Movie.find_movies_of_director(movie5.director).pluck(:title)).to_not include(['Puri'])
    end
  end
end