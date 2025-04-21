require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'reservation creation' do
    it 'invalid without reservation time' do
      reservation = build(:reservation, reservation_time: nil)
      expect(reservation).not_to be_valid
    end
    
    it 'invalid without user' do
      reservation = build(:reservation, user: nil)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:user]).to include("can't be blank")
    end
    
    it 'invalid without room' do
      reservation = build(:reservation, room: nil)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:room]).to be_present
    end
  end
end
