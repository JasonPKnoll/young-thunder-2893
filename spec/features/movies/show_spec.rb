require 'rails_helper'

RSpec.describe 'the studio index' do
  before(:each) do
    @studio = Studio.create!(name: "Universal Studios", location: "HollyWood")
    @movie = @studio.movies.create!(title: "The Mummy", creation_year: 1999, genre: "Adventure")
    @actor = @movie.actors.create!(name: "Brendan Fraser", age: 31)
    @actor2 = @movie.actors.create!(name: "Rachel Weisz", age: 29)
    @actor3 = @movie.actors.create!(name: "Arnold Vosloo", age: 37)
  end

  it "displays movie attrbutes" do
    visit "movies/#{@movie.id}"

    expect(page).to have_content("The Mummy")
    expect(page).to have_content("Adventure")
    expect(page).to have_content(1999)
  end

  it "displays all actors from youngest to oldests" do
    visit "movies/#{@movie.id}"

    expect("Rachel Weisz").to appear_before("Brendan Fraser")
    expect("Brendan Fraser").to appear_before("Arbikd Vosloo")
  end

  it "shows the average age of all actors" do
    visit "movies/#{@movie.id}"

    expect(page).to have_content(32.33)
  end
end
