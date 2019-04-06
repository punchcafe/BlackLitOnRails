require 'rails_helper'
require_relative '../helpers/web_helpers.rb'

RSpec.feature 'Admin can manage admins', type: :feature do

  scenario 'Admin can delete admins' do
    @admin = create(:admin)
    @admin2 = create(:admin, email: 'scapegoat@sorry.com')
    auto_sign_in
    click_on 'admins'
    expect("testboy@aol.com").to appear_before("scapegoat@sorry.com")
    all('.delete_admin')[0].click
    click_on 'admins'
    expect(page).to have_content("testboy@aol.com")
    expect(page).to_not have_content("scapegoat@sorry.com")
  end

  scenario 'admin cannot see own delete button' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'admins'
    expect(page).to_not have_content("delete")
    @admin2 = create(:admin, email: 'scapegoat@sorry.com')
    visit('/admindashboard')
    click_on 'admins'
    expect(page).to have_content("delete")
  end

end
