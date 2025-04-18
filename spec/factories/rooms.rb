# spec/factories/rooms.rb
FactoryBot.define do
  factory :room do
    name { "Room#{Faker::Number.unique.number(digits: 3)}" }
    capacity { Faker::Number.between(from: 1, to: 100) }
    
    institution
    building { association :building, institution: institution }
    floor    { association :floor, institution: institution }
  end
end