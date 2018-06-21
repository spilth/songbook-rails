class HomeController < ApplicationController
  def index
    @songs = Song.all.order(:title)
  end
end
