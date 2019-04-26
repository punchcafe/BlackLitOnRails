require 'bcrypt'

class PublicController < ApplicationController
  def home
    @episodes = Episode.all
  end
end
