require 'bcrypt'

FactoryBot.define do
  factory :public_text do
    public_text_name {"Mission Statement"}
    body {"Our mission statement is to be great."}
  end

  factory :episode do
    episode_name {"the first episode"}
    description {"easy"}
    spotify_link {"https://spotify.com/okthen"}
    soundcloud_link {"https://soundcloud.com/lol"}
    itunes_link {"https://itunes.com/okaythen"}
    episode_number {1}
  end

  factory :admin do
    email { "testboy@aol.com" }
    encrypted_password { ENV["hashsalt"] ? ENV["hashsalt"] : "" + BCrypt::Password.create("helloworld") }
    #encrypted_password  "$2a$10$ZzNU2b8bUGtj0YffX9EyGeQUjS3Yb77MYreZnuLiFhBAegh0Hv.M2"
    #helloworld
  end
end
