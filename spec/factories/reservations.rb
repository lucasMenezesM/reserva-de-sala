# spec/factories/reservations.rb
FactoryBot.define do
  factory :reservation do
    reservation_time { Faker::Time.forward(days: 5, period: :morning) }
    institution
    user {association :user, institution: institution}
    room {association :room, institution: institution}
  end
end
