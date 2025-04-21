require 'rails_helper'

RSpec.describe Floor, type: :model do
  describe 'creation validation' do
    it 'creates a floor with empty name' do
      floor = build(:floor, name: nil)

      expect(floor).not_to be_valid
    end
  end
end
