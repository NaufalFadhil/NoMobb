FactoryBot.define do
  factory :report do
    user_id { "MyString" }
    perpetrator { "MyString" }
    reason { "MyString" }
    proof { "MyString" }
    witness { "MyString" }
    incident_location { "MyString" }
    incident_date { "MyString" }
    status { "MyString" }
    is_valid { "MyString" }
    deleted_at { "MyString" }
  end
end
