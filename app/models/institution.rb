class Institution < ApplicationRecord
  has_many :floors, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :buildings, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
