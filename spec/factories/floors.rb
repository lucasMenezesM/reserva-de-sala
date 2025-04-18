# spec/factories/rooms.rb
FactoryBot.define do
  factory :floor do
    name { "Floor #{Faker::Number.number(digits: 1)}" }
    institution
  end
end