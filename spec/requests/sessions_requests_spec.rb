require "rails_helper"

describe "Public access to admin", type: :request do
  it "denies access to admins#dashboard" do
    get admindashboard_path
    expect(response).to redirect_to adminportal_path
  end
end
