class CreateStayhotels < ActiveRecord::Migration[5.2]
  def change
    create_table :stayhotels do |t|
      t.integer :user_id
      t.string :room_title
      t.text :room_intro
      t.bigint :room_price
      t.string :room_adress 
      t.string :room_image_id

      t.timestamps
    end
  end
end
