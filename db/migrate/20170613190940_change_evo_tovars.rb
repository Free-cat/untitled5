class ChangeEvoTovars < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :evo_tovars, :users, index: true
  end
end
