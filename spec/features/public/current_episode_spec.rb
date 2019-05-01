require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Public Next Episode Display', type: :feature do

  scenario 'users can see latest episode' do
    @episode = create(:episode)
    visit '/'
    expect(page.body).to have_content("Episode #01:")
    expect(page.body).to have_content("THE FIRST EPISODE")
  end

  scenario 'users can see latest episode' do
    @episode = create(:episode)
    @episode = create(:episode, episode_number: 2, episode_name: "The second episode")
    visit '/'
    expect(page.body).to have_content("Episode #02:")
    expect(page.body).to have_content("THE SECOND EPISODE")
  end

  scenario 'users can see latest episode, regardless of creation order' do
    @episode = create(:episode, episode_number: 2, episode_name: "The second episode")
    @episode = create(:episode)
    visit '/'
    expect(page.body).to have_content("Episode #02:")
    expect(page.body).to have_content("THE SECOND EPISODE")
  end

  scenario 'play on spotify button links to spotify'

end
