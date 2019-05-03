require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Pages page', type: :feature do

  scenario 'Admins may access Pages'
  scenario 'Anonmyous users may not access Pages'

end

RSpec.feature 'Mission Statement Display', type: :feature do

  scenario 'Admins can edit the Mission Statement Display' do
    @admin = create(:admin)
    @public_text = create(:public_text)
    auto_sign_in
    click_on 'pages'
    expect(page).to have_content("Our mission statement is to be great.")
    expect(page).to_not have_content("New and improved statement")
    click_on 'Mission Statement'
    fill_in 'Body', with: "New and improved statement"
    click_on 'Update'
    visit '/adminportal'
    click_on 'pages'
    expect(page).to_not have_content("Our mission statement is to be great.")
    expect(page).to have_content("New and improved statement")
  end

  scenario 'Admins can edit the Mission Statement Display and see it displayed on the public root' do
    @admin = create(:admin)
    @public_text = create(:public_text)
    visit '/'
    expect(page).to have_content("Our mission statement is to be great.")
    expect(page).to_not have_content("New and improved statement")
    auto_sign_in
    click_on 'pages'
    click_on 'Mission Statement'
    fill_in 'Body', with: "New and improved statement"
    click_on 'Update'
    visit '/'
    expect(page).to_not have_content("Our mission statement is to be great.")
    expect(page).to have_content("New and improved statement")
  end

  scenario 'Anonmyous users may not access Mission Statement editor'

end
