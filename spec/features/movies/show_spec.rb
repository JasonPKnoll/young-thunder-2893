require 'rails_helper'

RSpec.describe 'the studio index' do
  before(:each) do
    @studio = Studio.create!(name: "Universal Studios", location: "HollyWood")
    @movie = @studio.movies.create!(title: "The Mummy", creation_year: 1999, genre: "Adventure")
    @actor = @movie.actors.create!(name: "Brendan Fraser", age: 31)
    @actor2 = @movie.actors.create!(name: "Rachel Weisz", age: 29)
    @actor3 = @movie.actors.create!(name: "Arnold Vosloo", age: 37)
    @studio2 = Studio.create!(name: "Disney Pixar", location: "HollyWood")
    @movie2 = @studio.movies.create!(title: "Jaws", creation_year: 1975, genre: "Adventure")
    @actor4 = @movie2.actors.create!(name: "Roy Scheider", age: 43)
  end

  it "displays movie attrbutes" do
    visit "movies/#{@movie.id}"
    save_and_open_page

    expect(page).to have_content("The Mummy")
    expect(page).to have_content("Adventure")
    expect(page).to have_content(1999)
  end

  it "shows all actors from that movie" do
    visit "movies/#{@movie.id}"

    expect(page).to have_content("Brendan Fraser")
    expect(page).to have_content("Rachel Weisz")
    expect(page).to have_content("Arnold Vosloo")
    expect(page).to_not have_content("Roy Scheider")


  end

  it "displays all actors from youngest to oldests" do
    visit "movies/#{@movie.id}"

    expect("Rachel Weisz").to appear_before("Brendan Fraser")
    expect("Brendan Fraser").to appear_before("Arnold Vosloo")
  end

  it "shows the average age of all actors" do
    visit "movies/#{@movie.id}"

    expect(page).to have_content(32.33)
  end
end
