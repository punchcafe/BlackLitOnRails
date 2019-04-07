require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can see registered admins', type: :feature do

  scenario 'Admin can see admins on admin page' do
    @admin = create(:admin)
    @admin2 = create(:admin, email: "trebuchet@pokemon.com")
    auto_sign_in
    click_on 'admins'
    expect(page).to have_content("testboy@aol.com")
    expect(page).to have_content("trebuchet@pokemon.com")
  end

end
