require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Public Episode Display', type: :feature do

  scenario 'users can see episodes on the front page' do
    @episode = create(:episode)
    visit '/'
    expect(page.body).to have_content("Episode 1:")
    expect(page.body).to have_content("the first episode")
    expect(page.body).to have_content("easy")

  end

  scenario "users can't see unlisted episodes on the front page" do
    @episode = create(:episode, episode_number: "")
    visit '/'
    expect(page.body).to_not have_content("the first episode")
  end

  scenario "episodes are displayed in reverse episode_number order" do
    @episode_3 = create(:episode, episode_name: "im latest", episode_number: 3)
    @episode_2 = create(:episode, episode_name: "im middle", episode_number: 2)
    @episode_1 = create(:episode, episode_name: "im oldest", episode_number: 1)
    visit '/'
    expect("im latest").to appear_before("im middle")
    expect("im latest").to appear_before("im oldest")
    expect("im middle").to appear_before("im oldest")
  end

  scenario 'episodes display their episode picture twice if latest episode' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode_with_image
    visit('/')
    expect(page).to have_css("img[src*='episode_image.png']", count: 2)
  end

  scenario 'episodes display their episode picture' do
    @admin = create(:admin)
    auto_sign_in
    auto_create_episode_with_image
    @later_episode = create(:episode, episode_number: 2)
    visit('/')
    expect(page).to have_css("img[src*='episode_image.png']", count: 1)
  end


  scenario 'episodes contain podcast link buttons'
  scenario 'episodes dont contain podcast link buttons if not given'

end
