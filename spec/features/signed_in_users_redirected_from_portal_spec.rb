require 'rails_helper'

RSpec.feature 'Sign in admins are redirected from admin portal', type: :feature do
  scenario 'signed in admins visiting /adminportal are redirected' do
    @admin = create(:admin)
    visit('/adminportal')
    fill_in 'email', with:"testboy@aol.com"
    fill_in 'password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: testboy@aol.com")
    visit('/adminportal')
    expect(page).to have_current_path('/admindashboard')
  end
end
