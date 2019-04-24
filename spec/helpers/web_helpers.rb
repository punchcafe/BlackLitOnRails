def auto_sign_in
  visit('/adminportal')
  fill_in 'email', with:"testboy@aol.com"
  fill_in 'password', with:"helloworld"
  click_on 'Log in'
  expect(page).to have_content("Logged in: testboy@aol.com")
end

def auto_create_episode
  click_on 'episodes'
  click_on 'new'
  fill_in "Episode Name", with: "the book"
  fill_in "Episode #", with: "1"
  fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
  fill_in 'Spotify Link', with: "spotify.com/lol"
  fill_in 'Soundcloud Link', with: "soundlcoud.com/lol"
  fill_in 'Itunes Link', with: "itunes.com/lol"
  click_on 'Create'
end

def auto_create_episode_with_image
  click_on 'episodes'
  click_on 'new'
  fill_in "Episode Name", with: "the book"
  fill_in 'Episode Description', with: "this was the best book ever written by anyone anywhere, ever."
  fill_in 'Spotify Link', with: "spotify.com/lol"
  fill_in 'Soundcloud Link', with: "soundlcoud.com/lol"
  fill_in 'Itunes Link', with: "itunes.com/lol"
  attach_file("Episode Image", Rails.root + "spec/fixtures/episode_image.png")
  click_on 'Create'
end
