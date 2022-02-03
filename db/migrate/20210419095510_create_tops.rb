class CreateTops < ActiveRecord::Migration[5.2]
  def change
    create_table :tops do |t|
      t.datetime :registered_at
      t.text :contents
      t.integer :price
      t.string :category
      t.string :cost_type

      t.timestamps
    end
  end
end
