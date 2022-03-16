class Stayhotel < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  attachment :room_image
  validates :room_title, presence:true, length: { maximum: 30 }
  validates :room_intro, presence:true, length: { maximum: 400 }
  validates :room_price, presence:true
  validates :room_adress, presence:true
  validates :room_image, presence:true
end