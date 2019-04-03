def auto_sign_in
  visit('/adminportal')
  fill_in 'email', with:"testboy@aol.com"
  fill_in 'password', with:"helloworld"
  click_on 'Log in'
  expect(page).to have_content("Logged in: testboy@aol.com")
end
