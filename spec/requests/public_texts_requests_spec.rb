require 'rails_helper'

describe "Public Texts", type: :request do
  describe 'PUT /admin/public_texts/:id' do
    it "public may not edit public text" do
      @public_text = create(:public_text)
      put "/admin/public_texts/#{@public_text.id}", :params => {:public_text => { :body => "Hacked it!" }}
      expect(response).to have_http_status 401
    end

    it "admin may edit public text" do
      auto_sign_in
      @public_text = create(:public_text)
      put "/admin/public_texts/#{@public_text.id}", :params => {:public_text => { :body => "Hacked it!" }}
      expect(response).to_not have_http_status 401
      expect(PublicText.find(@public_text.id).body).to eq("Hacked it!")
    end
  end


  def auto_sign_in
    @admin = create(:admin)
    post "/session", :params => {email: "testboy@aol.com", password: "helloworld" }
  end
end
