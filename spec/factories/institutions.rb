# spec/factories/institutions.rb
FactoryBot.define do
  factory :institution do
    name { "Institution #{Faker::Lorem.word}" }
    address { Faker::Address.street_address }
    contact { Faker::PhoneNumber.phone_number }
  end
end
