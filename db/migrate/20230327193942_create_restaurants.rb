class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :image_url
      t.string :description
      t.integer :rating
      t.boolean :like

      t.timestamps
    end
  end
end
