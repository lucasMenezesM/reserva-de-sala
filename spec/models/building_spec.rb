require 'rails_helper'

RSpec.describe Building, type: :model do
  describe 'Building creation validation' do
    it 'Creates a building without name' do
      building = build(:building, name: nil)
      expect(building).not_to be_valid
    end
  end
end
