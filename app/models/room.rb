class Room < ApplicationRecord
  belongs_to :building
  belongs_to :floor

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, :capacity, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["building_id", "capacity", "created_at", "floor_id", "id", "name", "updated_at", "available_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["building", "floor", "reservations", "users"]
  end

  def is_available?(date, time)
    start_time = Time.zone.parse(time).strftime("%H:%M:%S")
  end_time = (Time.zone.parse(time) + 2.hours).strftime("%H:%M:%S")

  overlapping_reservations = Reservation.where(room: self, date: date)
                                        .where("time < ? AND time + INTERVAL '2 hours' > ?", end_time, start_time)

  overlapping_reservations.empty?
  end

  def self.available_rooms(date: nil, time: nil)
    if time.present? && date.present?
      time_range_start = Time.parse(time) - 2.hours
      time_range_end = Time.parse(time) + 2.hours

      occupied_room_ids = Reservation
                            .where("date = ? AND time >= ? AND time < ?", date, time_range_start, time_range_end)
                            .pluck(:room_id)

      return Room.where.not(id: occupied_room_ids)
    end

    if time.present?
      time_range_start = Time.parse(time) - 2.hours
      time_range_end = Time.parse(time) + 2.hours

      occupied_room_ids = Reservation
                            .where("time >= ? AND time < ?", time_range_start, time_range_end)
                            .pluck(:room_id)

      return Room.where.not(id: occupied_room_ids)
    end

    if date.present?
      occupied_room_ids = Reservation.where(date: date).pluck(:room_id)
      return Room.where.not(id: occupied_room_ids)
    end

    Room.all
  end

  def get_reserved_schedule
    Reservation.where(room: self).pluck(:date, :time)
  end

  def get_formatted_schedule
    schedule = get_reserved_schedule
    schedule.map { |date, time| "#{date.strftime('%Y-%m-%d')} | #{time.strftime('%H:%M')}" }.join("<br>").html_safe
  end
  
end
