require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'is_available method' do
    it 'checks a unavailable room' do
      room = build(:room)
      chosen_time = '2025-04-25T12:00:00'
      reservation = create(:reservation, room: room, reservation_time: chosen_time)
      reserved_time = DateTime.parse(chosen_time)
      expect(room).not_to be_is_available(reserved_time)
    end

    it 'checks a available room' do
      room = build(:room)
      chosen_time = '2025-04-25T12:00:00'
      reservation = create(:reservation, room: room, reservation_time: chosen_time)
      dates_list = [
        '2025-04-25T14:00:00',
        '2025-04-25T10:00:00'
      ]
      dates_list.each do |date|
        reserved_time = DateTime.parse(date)
        expect(room).to be_is_available(reserved_time)
      end
    end
  end
end