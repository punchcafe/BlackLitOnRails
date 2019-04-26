require 'bcrypt'

class PublicController < ApplicationController
  def home
    @episodes = Episode.order(:episode_number).reverse
  end
end
