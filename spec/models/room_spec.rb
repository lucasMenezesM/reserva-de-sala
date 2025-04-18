require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'should belong to the same institution as its building' do
    institution = create(:institution)
    building = create(:building, institution: institution)
    room = create(:room, building: building, institution: institution)

    expect(room.institution).to eq(building.institution)
  end
end