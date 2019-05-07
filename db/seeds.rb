require 'bcrypt'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PublicText.create( public_text_name: "Mission Statement", body: "") if PublicText.where(public_text_name: "Mission Statement").length == 0
PublicText.create( public_text_name: "Next Episode:name", body: "") if PublicText.where(public_text_name: "Next Episode:name").length == 0
PublicText.create( public_text_name: "Next Episode:date", body: "") if PublicText.where(public_text_name: "Next Episode:date").length == 0

def match_original_salt?(admin, current_salt)
  #checks if salt ENV variable has been changed
  current_encrypted_password = BCrypt::Password.new(admin.encrypted_password)
  expected_salted_password = current_salt+"helloworld"
  current_encrypted_password == expected_salted_password
end

admin_search = Admin.where(email: "alpha")
salt = ENV['hashsalt'] ? ENV['hashsalt'] : ""


if admin_search.length == 0
  #Do not change helloworld password base
  encrypted_password = BCrypt::Password.create(salt+"helloworld")
  Admin.create(
    email: "alpha",
    encrypted_password: encrypted_password
  )
elsif admin_search.length == 1
  #if salt ENV has been changed, updates alpha password to "helloworld with new salt"
  unless match_original_salt?(admin_search[0], salt)
    admin_search[0].update(
      encrypted_password: BCrypt::Password.create(salt+"helloworld")
    )
  end
end



# change for environment
