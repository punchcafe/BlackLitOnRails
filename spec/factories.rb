require 'bcrypt'

FactoryBot.define do
  factory :episode do
    episode_name {"scapegoat@netscape.com"}
    description {"easy"}
    spotify_link {"https://spotify.com/okthen"}
    soundcloud_link {"https://soundcloud.com/lol"}
    itunes_link {"https://itunes.com/okaythen"}
  end

  factory :admin do
    email { "testboy@aol.com" }
    encrypted_password { BCrypt::Password.create("helloworld") }
    #encrypted_password  "$2a$10$ZzNU2b8bUGtj0YffX9EyGeQUjS3Yb77MYreZnuLiFhBAegh0Hv.M2" 
    #helloworld
  end
end
