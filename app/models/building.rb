class Building < ApplicationRecord
  has_many :rooms

  validates :name, presence: true
end
