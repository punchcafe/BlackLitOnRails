require 'bcrypt'

class PublicController < ApplicationController
  def home
    @mission_statement = PublicText.where(public_text_name: "Mission Statement")[0]
    @episodes = Episode.order(:episode_number).reverse.select{ |episode| episode.episode_number}
  end
end
