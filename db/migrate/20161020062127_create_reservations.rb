class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.integer :listing_id
      t.integer :user_id
     
      t.timestamps
    end

    add_index :reservations, :user_id
        add_index :reservations, :listing_id
  end
end
