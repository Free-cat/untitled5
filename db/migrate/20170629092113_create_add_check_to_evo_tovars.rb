class CreateAddCheckToEvoTovars < ActiveRecord::Migration[5.1]
  def change
    add_column :evo_tovars, :check_post, :boolean
  end
end
