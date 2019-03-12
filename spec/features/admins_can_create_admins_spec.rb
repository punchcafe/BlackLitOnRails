require 'rails_helper'

RSpec.feature 'Admin can create other admins', type: :feature do
  scenario 'Admin can sign in' do
    @admin = create(:admin)
    visit('/adminportal')
    fill_in 'Email', with:"testboy@aol.com"
    fill_in 'Password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: testboy@aol.com")
    click_on "create admin"
    fill_in 'Email', with:"newboy@aol.com"
    fill_in 'Password', with:"helloworld"
    fill_in 'Confirm password', with:"helloworld"
    click_on 'create'
    click_on 'sign out'
    visit('/adminportal')
    fill_in 'Email', with:"newboy@aol.com"
    fill_in 'Password', with:"helloworld"
    click_on 'Log in'
    expect(page).to have_content("Logged in: newboy@aol.com")
  end
end
