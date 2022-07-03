FactoryBot.define do
  factory :consultation_message do
    roomchat_id { 1 }
    sender { 1 }
    message { "Halo" }
    receiver { 1 }
  end
end
