class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :user_id
      t.integer :plant_card

      t.timestamps
    end
  end
end
