class CreateNpcsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :npcs do |t|
      t.string :name 
      t.string :character_class
      t.integer :ally
      t.references :location
    end
  end
end
