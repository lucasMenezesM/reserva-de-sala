require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name validation' do
    it 'valid with name' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'invalid without name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe 'email validation' do
    it 'invalid without email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to be_present
    end

    it 'email already used' do
      create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to be_present
    end
  end
end
