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


if Admin.where(email: "alpha").length == 0
  salt = ENV['hashsalt'] ? ENV['hashsalt'] : ""
  encrypted_password = BCrypt::Password.create(salt+"helloworld")

  Admin.create(
    email: "alpha",
    encrypted_password: encrypted_password
  )
end

# change for environment
