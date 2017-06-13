class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :userUuid
      t.string :tokenEvo
      t.string :token
      t.string :key
      t.boolean :active
      t.timestamps
    end
  end
end
