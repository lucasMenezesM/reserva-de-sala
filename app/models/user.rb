class User < ApplicationRecord
  has_many :reservations
  has_many :rooms, through: :reservations

  enum profile: { admin: "admin", user: "user" }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
