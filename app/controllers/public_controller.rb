require 'bcrypt'

class PublicController < ApplicationController
  def home
    @episodes = Episode.order(:episode_number).reverse.select{ |episode| episode.episode_number}
  end
end
