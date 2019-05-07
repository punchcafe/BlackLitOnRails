require 'bcrypt'

PublicText.create( public_text_name: "Mission Statement", body: "") if PublicText.where(public_text_name: "Mission Statement").length == 0
PublicText.create( public_text_name: "Next Episode:name", body: "") if PublicText.where(public_text_name: "Next Episode:name").length == 0
PublicText.create( public_text_name: "Next Episode:date", body: "") if PublicText.where(public_text_name: "Next Episode:date").length == 0


admin_search = Admin.where(email: "alpha")
salt = ENV['hashsalt'] ? ENV['hashsalt'] : ""

if admin_search.length == 0
  encrypted_password = BCrypt::Password.create(salt+"helloworld")
  Admin.create(
    email: "alpha",
    encrypted_password: encrypted_password
  )
elsif admin_search.length == 1
  admin_search[0].update(
    encrypted_password: BCrypt::Password.create(salt+"helloworld")
  )
end
