class Npc < ActiveRecord::Base 
  belongs_to :location
  has_many :attacks
end