require 'rails_helper'

RSpec.describe "Episodes", type: :request do


  describe "POST /admin/episodes" do
    it "public may not create episode" do
      expect {
        post "/admin/episodes", :params => {
          :episode => {
            episode_name: "scapegoat@netscape.com",
            description: "easy",
            spotify_link: "https://spotify.com/okthen",
            soundcloud_link: "https://soundcloud.com/lol",
            itunes_link: "https://itunes.com/okaythen"
            }
          }
      }.to_not change(Episode, :count)
    end
    it "admin may create episode" do
      auto_sign_in
      expect {
        post "/admin/episodes", :params => {
          :episode => {
            episode_name: "scapegoat@netscape.com",
            description: "easy",
            spotify_link: "https://spotify.com/okthen",
            soundcloud_link: "https://soundcloud.com/lol",
            itunes_link: "https://itunes.com/okaythen"
            }
          }
      }.to change(Episode, :count)
    end
  end

  describe "DELETE admin/episodes/:id" do
    it "public may not delete episode" do
      @episode = create(:episode)
      expect { delete "/admin/episodes/#{@episode.id}" }.to_not change(Episode, :count)
    end

    it "admin may delete episode" do
      auto_sign_in
      @episode = create(:episode)
      expect { delete "/admin/episodes/#{@episode.id}" }.to change(Episode, :count)
    end

  end

  describe "PUT /episodes/:id" do
    it "public may not edit episode" do
      @episode = create(:episode)
      expect(Episode.find(@episode.id).episode_name).to eq("the first episode")
      expect(Episode.find(@episode.id).description).to eq("easy")
        put "/admin/episodes/#{@episode.id}", :params => {
          :episode => {
            episode_name: "OKAYOKAY!",
            description: "NEWDESC",
            spotify_link: "https://spotify.com/okthen",
            soundcloud_link: "https://soundcloud.com/lol",
            itunes_link: "https://itunes.com/okaythen"
            }
          }
      expect(Episode.find(@episode.id).episode_name).to_not eq("OKAYOKAY!")
      expect(Episode.find(@episode.id).description).to_not eq("NEWDESC")
    end

    it "admin may edit episode" do
      auto_sign_in
      @episode = create(:episode)
      expect(Episode.find(@episode.id).episode_name).to eq("the first episode")
      expect(Episode.find(@episode.id).description).to eq("easy")
        put "/admin/episodes/#{@episode.id}", :params => {
          :episode => {
            episode_name: "OKAYOKAY!",
            description: "NEWDESC",
            spotify_link: "https://spotify.com/okthen",
            soundcloud_link: "https://soundcloud.com/lol",
            itunes_link: "https://itunes.com/okaythen"
            }
          }
      expect(Episode.find(@episode.id).episode_name).to eq("OKAYOKAY!")
      expect(Episode.find(@episode.id).description).to eq("NEWDESC")
    end
  end

  describe "GET admin/episodes/" do
    it "admin may visit episodes page" do
      auto_sign_in
      get admin_episodes_path
      expect(response).to have_http_status 200
    end
    it "public may not visit episodes page" do
      get admin_episodes_path
      expect(response).to redirect_to adminportal_path
    end
  end

  describe "GET admin/episodes/new" do
    it "admin may access new episode page" do
      auto_sign_in
      get new_admin_episode_path
      expect(response).to have_http_status 200
    end
    it "public may not access new episode page" do
      get new_admin_episode_path
      expect(response).to redirect_to adminportal_path
    end
  end

  describe "GET admin/episodes/:id/edit" do
    it "public may not access episode edit page" do
      @episode = create(:episode)
      get "/admin/episodes/#{@episode.id}/edit"
      expect(response).to redirect_to adminportal_path
    end

    it "admin may access episode edit page" do
      auto_sign_in
      @episode = create(:episode)
      get "/admin/episodes/#{@episode.id}/edit"
      expect(response).to have_http_status 200
    end
  end

  describe "GET /episodes/:id" do
    it "public may not access episode show page" do
      @episode = create(:episode)
      get "/admin/episodes/#{@episode.id}"
      expect(response).to redirect_to adminportal_path
    end

    it "admin may access episode show page" do
      auto_sign_in
      @episode = create(:episode)
      get "/admin/episodes/#{@episode.id}"
      expect(response).to have_http_status 200
    end
  end

  private

  def auto_sign_in
    @admin = create(:admin)
    post "/session", :params => {email: "testboy@aol.com", password: "helloworld" }
  end

end
