# spec/factories/buildings.rb
FactoryBot.define do
  factory :building do
    name { "Building #{Faker::Number.number(digits: 1)}" }
    institution
  end
end