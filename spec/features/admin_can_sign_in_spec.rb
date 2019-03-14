require 'rails_helper'

RSpec.feature 'Admin can sign in', type: :feature do
  scenario 'Admin can sign in' do
    @admin = create(:admin)
    visit('/adminportal')
    fill_in 'email', with:"testboy@aol.com"
    fill_in 'password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: testboy@aol.com")
  end
end
