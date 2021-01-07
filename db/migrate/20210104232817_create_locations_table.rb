class CreateLocationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name 
      t.string :image
      t.string :song
    end
  end
end
