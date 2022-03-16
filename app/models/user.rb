class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :stayhotels, dependent: :destroy
  has_many :reservations, dependent: :destroy
  
  validates :username, presence:true
  validates :email, presence:true
  
end