class CreateEvoTovars < ActiveRecord::Migration[5.1]
  def change
    create_table :evo_tovars do |t|
      t.string :uuid
      t.string :code
      t.string :barCodes
      t.string :name
      t.float :price
      t.integer :quantity
      t.float :costPrice

      t.timestamps
    end
  end
end
