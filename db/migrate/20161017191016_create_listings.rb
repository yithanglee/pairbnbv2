class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :location
      t.integer :price
      t.string :availability

      t.timestamps
    end
  end
end
