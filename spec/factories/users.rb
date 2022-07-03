FactoryBot.define do
  factory :user do
    name { "Naufal Fadhil Athallah" }
    email { "naufalfadhil@gmail.co" }
    phone { "08123456789" }
    password { "naufalfadhil" }
    is_verified { true }
    role { "BASIC" }
  end
end
