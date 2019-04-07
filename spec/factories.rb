FactoryBot.define do
  factory :episode do

  end

  factory :admin do
    email { "testboy@aol.com" }
    encrypted_password  { "helloworld" }
  end
end
