require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can CRUD an episode', type: :feature do

  scenario 'users can see episodes on the front page' do
    @episode = create(:episode)
    visit '/'
    expect(page.body).to have_content("the first episode")
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

end
