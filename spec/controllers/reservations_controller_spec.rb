require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe "Reservation Creation Validations" do
    let(:user) { create(:user) }
    let(:room) { create(:room) }

    before do 
      sign_in user
    end
    
    it 'validates a room with available reserve time' do
      post :create, params: {
        room_id: room.id,
        reservation: {chosen_time: "2025-04-10T13:00:00"}
      }

      flash[:notice] = "Reservation successfully created!"
      expect(flash[:notice]).to eq("Reservation successfully created!")
      expect(response).to redirect_to(room_path(room.id))
    end

    it 'invalid reservation with time conflict' do
      existing_reservation = create(
        :reservation,
        user: user,
        room: room,
        reservation_time: '2025-04-25T13:00:00',
        institution: user.institution
      )

      reserve_time_list = [
        '2025-04-25T11:30:00',
        '2025-04-25T12:00:00',
        '2025-04-25T13:30:00',
        '2025-04-25T14:00:00',
        '2025-04-25T14:30:00',
      ]

      reserve_time_list.each do |reserve_time|
        post :create, params: {
          room_id: room.id,
          reservation: {chosen_time: reserve_time}
        }
        
        expect(flash[:alert]).to eq("This room is not available at the moment you choose")
        expect(response).to redirect_to(room_path(room.id))
      end

    end

    it 'makes reservation with date before the current time' do
      post :create, params: {
        room_id: room.id,
        reservation: {chosen_time: '2025-01-25T13:30:00'}
      }

      expect(flash[:alert]).to eq("Error: Choose a valid date to make your reservation!")
      expect(response).to redirect_to(room_path(room.id))
    end
  end
end
