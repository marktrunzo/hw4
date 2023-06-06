class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :places
  
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
