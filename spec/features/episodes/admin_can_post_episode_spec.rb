require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can create an episode without a picture', type: :feature do

  scenario 'Admin can create admins' do
    @admin = create(:admin)
    auto_sign_in
    click_on 'episodes'
    click_on 'new'
    fill_in 'Episode Title', with: "the book"
    fill_in 'Description', with: "this was the best book ever written by anyone anywhere, ever."
    fill_in 'Spotify link', with: "spotify.com/lol"
    fill_in 'SoundCloud link', with: "soundlcoud.com/lol"
    fill_in 'Itunes link', with: "itunes.com/lol"
    click_on 'Create'
    click_on 'episodes'
    expect(page).to have_content("the book")
    expect(page).to have_content("this was the best book ever written by anyone anywhere, ever.")
  end

end
