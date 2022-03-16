class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :stayhotel

    validates :start_date, presence:true
    validates :end_date, presence:true
    validates :people_num, presence:true
    validates :people_num, numericality: { greater_than_or_equal_to: 1, less_than: 100 }, presence:true
end
