require 'rails_helper'
require_relative '../../helpers/web_helpers.rb'

RSpec.feature 'Admin can CRUD an episode', type: :feature do

  scenario 'users can see episodes on the front page' do
    @episode = create(:episode)
    visit '/'
  end

end
