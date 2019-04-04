require 'rails_helper'
require_relative '../helpers/web_helpers.rb'

RSpec.feature 'Admin can manage admins', type: :feature do

  scenario 'Admin can delete admins' do
    @admin = create(:admin)
    @admin2 = create(:admin, email: 'scapegoat@sorry.com')
    auto_sign_in
    click_on 'admins'
    expect("testboy@aol.com").to appear_before("scapegoat@sorry.com")
    page.all('delete')[1].click
    click_on 'admins'
    expect(page).to have_content("testboy@aol.com")
    expect(page).to_not have_content("scapegoat@sorry.com")
  end

end
