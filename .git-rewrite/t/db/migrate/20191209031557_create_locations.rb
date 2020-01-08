class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :headline
      t.text :description
      t.string :danger_level

      t.timestamps
    end
  end
end
