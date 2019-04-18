require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can CRUD an episode without a picture', type: :feature do

  scenario 'Admin can create episodes without an episode image' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Spotify Link', with: "spotify.com/lol"
    fill_in 'Soundcloud Link', with: "soundlcoud.com/lol"
    fill_in 'Itunes Link', with: "itunes.com/lol"
    click_on 'Create'
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
  end

  scenario 'Admin can create episodes with an episode image' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Spotify Link', with: "spotify.com/lol"
    fill_in 'Soundcloud Link', with: "soundlcoud.com/lol"
    fill_in 'Itunes Link', with: "itunes.com/lol"
    attach_file("Episode Image", Rails.root + "spec/fixtures/portal_logo.png")
    click_on 'Create'
    click_on 'episodes'

    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
    expect(page).to have_css("img[src*='w3schools']")
  end



  scenario 'Admin can delete episodes' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Spotify Link', with: "spotify.com/lol"
    fill_in 'Soundcloud Link', with: "soundlcoud.com/lol"
    fill_in 'Itunes Link', with: "itunes.com/lol"
    click_on 'Create'
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
    click_on "Delete"
    click_on 'episodes'
    expect(page).to_not have_content("the book")
    expect(page).to_not have_content("this was the best book ever written by anyone anywhere, ever.")
  end

  scenario 'Admin can edit episodes' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Spotify Link', with: "spotify.com/lol"
    fill_in 'Soundcloud Link', with: "soundlcoud.com/lol"
    fill_in 'Itunes Link', with: "itunes.com/lol"
    click_on 'Create'
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
