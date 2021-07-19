require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should belong_to(:movie) }
  end

  before(:each) do
    @studio = Studio.create!(name: "Universal Studios", location: "HollyWood")
    @movie = @studio.movies.create!(title: "The Mummy", creation_year: 1999, genre: "Adventure")
    @actor = @movie.actors.create!(name: "Brendan Fraser", age: 31)
    @actor2 = @movie.actors.create!(name: "Rachel Weisz", age: 29)
    @actor3 = @movie.actors.create!(name: "Arnold Vosloo", age: 37)
  end

  it "can show actors by order from age" do
    expect(Actor.sort_by_age).to eq([@actor2, @actor, @actor3])
  end

  it "can take average of actors ages" do
    expect(Actor.average_age).to eq(32.33)
  end
end
