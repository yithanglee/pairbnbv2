class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
  	change_column :listings, :avatars, 'json USING CAST(avatars AS json)'
  end
end
