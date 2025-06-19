class User < ApplicationRecord
  has_secure_password
  has_many :farms, dependent: :destroy

  validates :name, :username, :email, :birthdate, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true
end 