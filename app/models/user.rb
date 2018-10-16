class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  has_many :games
  
  validates :password, presence: true, on: :create
  validates_confirmation_of :password, on: :create
end
