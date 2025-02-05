class Institution < ApplicationRecord
  has_many :floors
  has_many :rooms
  has_many :buildings
  has_many :reservations
  
end
