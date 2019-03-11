require 'rails_helper'

RSpec.feature 'Admin can sign in', type: :feature do
  scenario 'Admin can sign in' do
    visit('/adminportal')
    fill_in 'email', with:"testboy@aol.com"
    fill_in 'password', with:"helloworld"
    click_on 'sign in'
    expect(page).to have_content("Welcome back, testman")
  end
end
