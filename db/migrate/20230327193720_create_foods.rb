class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.string :description
      t.integer :rating
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
