class Building < ApplicationRecord
  has_many :rooms
  belongs_to :institution

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
