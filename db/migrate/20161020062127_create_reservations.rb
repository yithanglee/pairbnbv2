class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :listing_id
      t.integer :booking_date_id
      t.integer :user_id
     
      t.timestamps
    end
  end
end
