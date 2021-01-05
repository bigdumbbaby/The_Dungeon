class Npc < ActiveRecord::Base 
  belongs_to :location
  has_many :attacks

  def location 
    Location.all.find{|place| place.id == self.location_id}
  end
  def self.list_allies
    all.select{ |person| person.ally == 1}
  end

  def get_attacks
    Attack.all.select{ |attack| attack.npc_id == self.id}
  end

end