class Attack < ActiveRecord::Base
  belongs_to :npc

  def self.gets_attack_by_name name
    all.find{ |attack| attack.name == name}
  end

  def play_sound 
    pid = fork{ exec 'afplay', self.sound }
  end
end