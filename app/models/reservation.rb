class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :institution

  has_one :building, through: :room
  has_one :floor, through: :room

  def self.ransackable_associations(auth_object = nil)
    ["room", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "room_id", "schedule", "updated_at", "user_id"]
  end

  def get_formatted_reservation_schedule
    date = schedule.strftime("%m/%d")
    time = schedule.strftime("%H:%M")
    "#{date}, #{time}"
  end

  def get_schedule
    formatted_time = time.strftime("%H:%M")
    "#{date}, #{formatted_time}"
  end
  
end
