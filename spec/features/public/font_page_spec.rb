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

end
