require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Episode displays linked episodes with icons', type: :feature do
  scenario 'will display all icons if all icons exist' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode
    click_on 'episodes'
    expect(page).to have_css("img[src*='icon-itunes.png']")
    expect(page).to have_css("img[src*='icon-spotify.png']")
    expect(page).to have_css("img[src*='icon-soundcloud.png']")
  end

  scenario 'will display only spotify icon if only spotify link exists' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Spotify Link', with: "spotify.com/lol"
    click_on 'Create'
    click_on 'episodes'
    expect(page).to_not have_css("img[src*='icon-itunes.png']")
    expect(page).to have_css("img[src*='icon-spotify.png']")
    expect(page).to_not have_css("img[src*='icon-soundcloud.png']")
  end

  scenario 'will display only soundcloud icon if only soundcloud link exists' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Soundcloud Link', with: "soundcloud.com/lol"
    click_on 'Create'
    click_on 'episodes'
    expect(page).to_not have_css("img[src*='icon-itunes.png']")
    expect(page).to_not have_css("img[src*='icon-spotify.png']")
    expect(page).to have_css("img[src*='icon-soundcloud.png']")
  end

  scenario 'will display only itunes icon if only itunes link exists' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in "Episode Name", with: "the book"
    fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Itunes Link', with: "itunes.com/lol"
    click_on 'Create'
    click_on 'episodes'
    expect(page).to have_css("img[src*='icon-itunes.png']")
    expect(page).to_not have_css("img[src*='icon-spotify.png']")
    expect(page).to_not have_css("img[src*='icon-soundcloud.png']")
  end
end
