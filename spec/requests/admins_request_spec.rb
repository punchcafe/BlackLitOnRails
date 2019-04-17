describe "Admin create destroy", type: :request do
  describe 'DELETE /admins/:id' do
    it "admin cannot destroy self" do
      auto_sign_in
      expect {
        delete "/admins/#{@admin.id}", :params => { id: @admin.id}
      }.to_not change(Admin, :count)
    end

    it "public may not destroy" do
      @admin = create(:admin)
      expect {
        delete "/admins/#{@admin.id}", :params => { id: @admin.id}
      }.to_not change(Admin, :count)
    end

    it "admin may destroy" do
      auto_sign_in
      @admin2 = create(:admin, email: "lol@ok.com")
      expect {
        delete "/admins/#{@admin2.id}", :params => { id: @admin2.id}
      }.to change(Admin, :count).by(-1)
    end

  end

  describe 'POST /admins/' do
    it "admin may create" do
      auto_sign_in
      expect {
        post "/admins", :params => { :admin => {email: "scapegoat@netscape.com", password: "easy"}}
      }.to change(Admin, :count).by(1)
    end

    it "public may not create" do
      expect {
        post "/admins", :params => { :admin => {email: "scapegoat@netscape.com", password: "easy"}}
      }.to_not change(Admin, :count)
    end
  end
  #create the admin but don't sign in

  #check for difference

  private

  def auto_sign_in
    @admin = create(:admin)
    post "/session", :params => {email: "testboy@aol.com", password: "helloworld" }
  end
end
