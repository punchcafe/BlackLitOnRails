require 'rails_helper'

describe "Public Texts", type: :request do
  describe 'PUT /admin/public_texts/:id' do
    it "public may not edit public text" do
      @public_text = create(:public_text)
      put "/admin/public_texts/#{@public_text.id}", :params => {:public_text => { :body => "Hacked it!" }}
      expect(response).to have_http_status 401
    end
  end
end
