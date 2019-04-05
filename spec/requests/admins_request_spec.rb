describe "Admin create destroy", type: :request do

  it "admin cannot destroy self" do
    @admin = create(:admin)
    auto_sign_in
    expect {
      delete "/admins/#{@admin.id}", :params => { id: @admin.id}
    }.to_not change(Admin, :count)
    expect(response).to redirect_to admins_path
  end

  it "public may not destroy" do
    @admin = create(:admin)
    expect {
      delete "/admins/#{@admin.id}", :params => { id: @admin.id}
    }.to raise_error('Unauthorized action')
  end
  #create the admin but don't sign in

  it "public may not create"
  #check for difference

  private

  def auto_sign_in
    post "/session", :params => {email: "testboy@aol.com", password: "helloworld" }
  end
end
