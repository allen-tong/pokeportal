class HomeController < ApplicationController

  def index
    wild = ['Bulbasaur', 'Charmander', 'Squirtle', 'Pikachu']
    @pokemon = wild.sample
  end

end
