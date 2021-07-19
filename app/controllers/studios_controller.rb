class StudiosController < ApplicationController

  def index
    @studios = Studio.all
    @movies = Movies.all
  end

end
