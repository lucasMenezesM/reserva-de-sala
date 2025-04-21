class User < ApplicationRecord
  has_many :reservations
  has_many :rooms, through: :reservations
  belongs_to :institution, optional: true

  enum profile: { admin: "admin", user: "user" }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :profile, inclusion: { in: %w[user admin] }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "name", "profile", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  def get_reserved_rooms(room)
    Reservation.where(user: self, room: room)
  end
end
