class CreateLocationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name 
    end
  end
end
