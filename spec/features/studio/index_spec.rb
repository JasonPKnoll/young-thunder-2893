require 'rails_helper'

RSpec.describe 'the studio index' do
  before(:each) do
    @studio = Studio.create!(name: "Universal Studios", location: "HollyWood")
    @studio2 = Studio.create!(name: "Disney Pixar", location: "HollyWood")
    @movie = @studio.movies.create!(title: "The Mummy", creation_year: 1999, genre: "Horror")
    @movie2 = @studio.movies.create!(title: "Jaws", creation_year: 1975, genre: "Adventure")
    @movie3 = @studio2.movies.create!(title: "Finding Nemo", creation_year: 2003, genre: "Adventure")
    @movie4 = @studio2.movies.create!(title: "Up", creation_year: 2009, genre: "Adventure")
  end

  it 'displays studio and its movies' do
    visit "/studios"
    save_and_open_page

    expect(page).to have_content("Universal Studios")
    expect(page).to have_content("The Mummy")
    expect(page).to have_content("Jaws")
    expect(page).to have_content("Disney Pixar")
    expect(page).to have_content("Jaws")
    expect(page).to have_content("Up")
  end
end
