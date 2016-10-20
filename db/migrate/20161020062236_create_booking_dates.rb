class CreateBookingDates < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_dates do |t|
    	t.date :booking_date
    	t.integer :reservation_id
      t.integer :listing_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :booking_dates, :booking_date
    
  end
end
