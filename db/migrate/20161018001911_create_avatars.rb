class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.references :listing, foreign_key: true
      t.string :avatars

      t.timestamps
    end
  end
end
