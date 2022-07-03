FactoryBot.define do
  factory :report do
    user_id { 1 }
    perpetrator_fullname { "Naufal Fadhil Athallah" }
    perpetrator_nickname { "Fadhil" }
    perpetrator_birthday { "2001-01-01" }
    reason { "Dibully oleh teman" }
    proof { "https://drive.google.com" }
    witness { "Teman" }
    incident_location { "SMK NEGER 1" }
    incident_date { "2022-05-01" }
    status { "PENDING" }
    is_valid { false }
  end
end
