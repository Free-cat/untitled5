class ChangeEvoTovars2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :evo_tovars, :barCodes, :string
    add_column :evo_tovars, :barCodes, :string, array: true, default: []
    remove_column :evo_tovars, :alcoCodes, :string
    add_column :evo_tovars, :alcoCodes, :string, array: true, default: []
  end
end
