describe "Admin create destroy", type: :request do
  it "admin cannot destroy self" do
    @admin = create(:admin)
    auto_sign_in
    expect {
      delete "/admins/#{@admin.id}", :params => { id: @admin.id}
    }.to_not change(Admin, :count)
    expect(response).to redirect_to admins_path
  end

  private

  def auto_sign_in
    post "/session", :params => {email: "testboy@aol.com", password: "helloworld" }
  end
end
