class CreateReservationDates < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_dates do |t|
		t.integer :reservation_id
  		t.date :staying_dates
      t.timestamps
    end

    
  	add_index :reservation_dates, :reservation_id
  	add_index :reservation_dates, :staying_dates
  end
end
