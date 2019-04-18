describe "Admin create destroy", type: :request do
  describe 'DELETE /admin/episodes/:id/episodeimage' do
    it "public may not delete image" do
      @episode = create(:episode)
      delete "/admin/episodes/#{@episode.id}/episodeimage"
      expect(response).to have_http_status 401
    end

  end
end
