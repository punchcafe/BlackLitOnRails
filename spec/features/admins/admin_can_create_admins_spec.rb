require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can manage admins', type: :feature do

  scenario 'Admin can create admins' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'admins'
    click_on 'create admin'
    fill_in 'Email', with: "newkid@yugioh.com"
    fill_in 'Password', with: "kungfury"
    click_on 'Create'
    click_on 'Log out'
    visit('/adminportal')
    fill_in 'email', with:"newkid@yugioh.com"
    fill_in 'password', with:"kungfury"
    click_on 'Log in'
    expect(page).to have_content("Logged in: newkid@yugioh.com")
  end

end
