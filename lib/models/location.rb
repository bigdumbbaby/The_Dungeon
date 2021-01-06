class Location < ActiveRecord::Base 
  has_many :npcs

  def npcs
    Npc.all.select{ |npc| npc.location_id == self.id}
  end

  def self.find_location_by_name name 
    Location.all.find{ |place| place.name == name}
  end
end