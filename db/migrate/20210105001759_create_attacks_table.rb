class CreateAttacksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :attacks do |t|
      t.string :name
      t.integer :max
      t.integer :min
      t.string :image
      t.string :sound
      t.references :npc
    end
  end
end
