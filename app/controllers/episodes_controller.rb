class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  before_action :boot_anonymous, only: [:index, :show, :new, :edit]

  def index
    @current_admin = current_admin
    @episodes = Episode.all
  end

  def show
    @current_admin = current_admin
  end

  def new
    @current_admin = current_admin
    @episode = Episode.new
  end

  def edit
    @current_admin = current_admin
  end

  def create
    return 0 unless current_admin
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to admin_episodes_path, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    return 0 unless current_admin
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to admin_episode_path(@episode), notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return 0 unless current_admin
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to admin_episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def boot_anonymous
      redirect_to adminportal_path unless current_admin
    end

    def set_episode
      @episode = Episode.find(params[:id])
    end

    def episode_params
      params.require(:episode).permit(:episode_name, :description, :spotify_link, :soundcloud_link, :itunes_link)
    end
end
