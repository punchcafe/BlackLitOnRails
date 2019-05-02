require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Pages page', type: :feature do

  scenario 'Admins may access Pages'
  scenario 'Anonmyous users may not access Pages'

end

RSpec.feature 'Mission Statement Display', type: :feature do

  scenario 'Admins can edit the Mission Statement Display' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'pages'
    expect(page).to_not have_content("Our mission statement is to be great.")
    click_on 'Mission Statement'
    fill_in 'body', with: "Our mission statement is to be great."
    click_on 'update'
    visit '/adminportal'
    click_on 'pages'
    expect(page).to have_content("Our mission statement is to be great.")
  end
  
  scenario 'Admins can edit the Mission Statement Display and see it displayed on the public root'

  scenario 'Anonmyous users may not access Mission Statement editor'

end
