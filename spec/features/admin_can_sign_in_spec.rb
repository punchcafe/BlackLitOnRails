require 'rails_helper'

RSpec.feature 'Admin can sign in', type: :feature do
  scenario 'Admin can sign in' do
    visit('/adminportal')
    fill_in 'Email', with:"testboy@aol.com"
    fill_in 'Password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: testboy@aol.com")
  end
end
