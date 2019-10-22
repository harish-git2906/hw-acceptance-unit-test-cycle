require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    
    before :each do
      @mock_results = [double('movie1'), double('movie2')]
    end
    
    it 'should call the model method that performs filter by director name ' do
      expect(Movie).to receive(:find_movies_of_director).with('Ron Clements').
      and_return(@mock_results) 
      post :find_with_same_director, {:id => 1}  
    end
    
    it 'should select the same_director view for rendering' do
      allow(Movie).to receive(:find_movies_of_director).with('Ron Clements').
                     and_return(@mock_results)
      post :find_with_same_director, {:id => 1}
      expect(response).to render_template('find_with_same_director') #check if right view is rendered or not
    end
    
    it 'should make the movies results available to the view template' do
      allow(Movie).to receive(:find_movies_of_director).with('Ron Clements').
                     and_return(@mock_results)
      post :find_with_same_director, {:id => 1}
      expect(assigns(:movies)).to eq(@mock_results)
    end
    
    it 'movie with no director name should redirect to home page' do
      post :find_with_same_director, {:id => 5}  # id 5 has no director name
      expect(response).to redirect_to(movies_path)                         
    end
  
  end
end