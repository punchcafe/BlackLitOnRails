require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can CRUD an episode without a picture', type: :feature do

  scenario 'Admin can create episodes without an episode image' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
  end

  scenario 'Admin can create episodes with an episode image' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode_with_image
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
    expect(page).to have_css("img[src*='episode_image.png']")
  end

  scenario 'Admin can delete episodes' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
    click_on "Delete"
    click_on 'episodes'
    expect(page).to_not have_content("the book")
    expect(page).to_not have_content("this was the best book ever written by anyone anywhere, ever.")
  end

  scenario 'Admin can delete episode_image' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode_with_image
    click_on 'episodes'
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
    expect(page).to have_css("img[src*='episode_image.png']")
    click_on "Edit"
    click_on "Delete Picture"
    click_on 'episodes'
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
    expect(page).to_not have_css("img[src*='episode_image.png']")
  end

  scenario 'Admin can edit episodes' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode
    click_on 'episodes'
    click_on "Edit"
    fill_in 'Episode Description', with: "new description"
    click_on 'Update Episode'
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to_not have_content("this was the best book ever written by anyone anywhere, ever.")
    expect(page).to have_content("new description")
  end

end
