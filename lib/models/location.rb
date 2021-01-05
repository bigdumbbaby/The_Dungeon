class Location < ActiveRecord::Base 
  has_many :npcs

  def npcs
    Npc.all.select{ |npc| npc.location_id == self.id}
  end
end