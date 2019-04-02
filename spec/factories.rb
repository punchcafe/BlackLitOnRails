FactoryBot.define do
  factory :admin do
    email { "testboy@aol.com" }
    encrypted_password  { "helloworld" }
  end
end
