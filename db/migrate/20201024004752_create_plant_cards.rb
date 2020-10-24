class CreatePlantCards < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_cards do |t|
      t.string :name
      t.timestamps
    end
  end
end
