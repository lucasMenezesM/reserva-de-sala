class Room < ApplicationRecord
  belongs_to :building
  belongs_to :floor

  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :capacity, presence: true

  def is_available?(datetime)
    start_time = datetime.to_datetime
    end_time = start_time + 2.hours
  
    reservations = Reservation.where(room: self)
                                          .where("schedule < ? AND schedule + INTERVAL '2 hours' > ?", end_time, start_time)
    
    reservations.empty?
  end
end
