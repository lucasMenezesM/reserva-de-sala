class Room < ApplicationRecord
  belongs_to :building
  belongs_to :floor

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  belongs_to :institution

  validates :name, :capacity, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["building_id", "capacity", "created_at", "floor_id", "id", "name", "updated_at", "available_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["building", "floor", "reservations", "users"]
  end

  def is_available?(chosen_time)
    start_time = chosen_time - 2.hours + 1.minutes
    end_time = chosen_time + 2.hours + 1.minutes

    overlapping_reservations = Reservation.where(room: self)
      .where("reservation_time BETWEEN ? AND ?", start_time, end_time)

    overlapping_reservations.empty?
  end

  def self.available_rooms(chosen_time)
    start_time = chosen_time - 2.hours + 1
    end_time = chosen_time + 2.hours + 1

    occupied_room_ids = Reservation.where("reservation_time BETWEEN ? AND ?", start_time, end_time)
                                   .pluck(:room_id)

    return Room.where.not(id: occupied_room_ids)
  end

  def get_reserved_schedule
    Reservation.where(room: self).pluck(:reservation_time)
  end

  def get_formatted_schedule
    get_reserved_schedule.map do |reservation|
      reservation.strftime("%d/%m/%Y %H:%M")
    end.join("<br>").html_safe
  end
  
end
