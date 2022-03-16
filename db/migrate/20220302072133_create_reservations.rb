class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :stayhotel_id
      t.date :start_date
      t.date :end_date
      t.integer :days
      t.integer :people_num
      t.bigint :sum_price
      
      t.timestamps
    end
  end
end
