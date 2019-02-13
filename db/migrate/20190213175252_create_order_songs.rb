class CreateOrderSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :order_songs do |t|
      t.references :song, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
    end
  end
end
