class EpisodeimagesController < ApplicationController
  before_action :set_episode, only: [:destroy]

  def destroy
    return head(401) unless current_admin
    @episode.episode_image.purge
    redirect_to admin_episodes_path
  end

  private

  def set_episode
    @episode = Episode.find(params[:episode_id])
  end
end
