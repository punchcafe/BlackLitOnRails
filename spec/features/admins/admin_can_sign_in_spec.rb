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
  scenario 'signed in admins visiting /adminportal are redirected' do
    @admin = create(:admin)
    visit('/adminportal')
    fill_in 'email', with:"testboy@aol.com"
    fill_in 'password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: testboy@aol.com")
    visit('/adminportal')
    expect(page).to have_current_path('/admin/episodes')
  end

  scenario 'signed in admin can sign out' do
    @admin = create(:admin)
    visit('/adminportal')
    fill_in 'email', with:"testboy@aol.com"
    fill_in 'password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: testboy@aol.com")
    click_on 'Log out'
    expect(page).to_not have_content("Logged in: testboy@aol.com")
    visit('/admindashboard')
    expect(page).to_not have_content("Logged in: testboy@aol.com")
  end

  scenario 'anonymous visitors to "/admindashboard" are redirected' do
    visit('/admindashboard')
    expect(page).to have_current_path('/adminportal')
  end

end
