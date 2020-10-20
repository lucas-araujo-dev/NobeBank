class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email
end
