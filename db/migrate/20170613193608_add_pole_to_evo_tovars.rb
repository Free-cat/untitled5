class AddPoleToEvoTovars < ActiveRecord::Migration[5.1]
  def change
    add_column :evo_tovars, :alcoCodes, :string, array: true
    add_column :evo_tovars, :measureName, :string, default: 'шт'
    add_column :evo_tovars, :tax, :string, default: 'VAT_0'
    add_column :evo_tovars, :allowToSell, :boolean, default: true
    add_column :evo_tovars, :description, :string, default: ''
    add_column :evo_tovars, :parentUuid, :string, default: 'null'
    add_column :evo_tovars, :group, :boolean, default: false
    add_column :evo_tovars, :type, :string, default: 'NORMAL'
    add_column :evo_tovars, :alcoholByVolume, :float, default: '0'
    add_column :evo_tovars, :alcoholProductKindCode, :integer, default: '0'
    add_column :evo_tovars, :tareVolume, :float, default: '0'
    remove_column :evo_tovars, :barCodes, :string
    add_column :evo_tovars, :barCodes, :string, array: true
  end
end
