Attack.destroy_all
Npc.destroy_all
Location.destroy_all

tavern = Location.create name: "Tavern"
farm = Location.create name: "Farm"
castle = Location.create name: "Castle"

ben = Npc.create name: "Ben Hen", character_class: "Wizard", ally: 0, location_id: tavern.id 
anne = Npc.create name: "Anne Fan", character_class: "Archer", ally: 0, location_id: tavern.id
lucas = Npc.create name: "lucas mucas", character_class: "Thief", ally: 0, location_id: farm.id
jackson = Npc.create name: "jackson macson", character_class: "Knight", ally: 0, location_id: castle.id

wizard_attack_1 = Attack.create name: "Fireball", max: 50, min: 30, npc_id: ben.id
wizard_attack_2 = Attack.create name: "Lightnight", max: 40, min: 35, npc_id: ben.id
archer_attack_1 = Attack.create name: "arror storm", max: 60, min: 20, npc_id: anne.id
archer_attack_2 = Attack.create name: "dagger slash", max: 40, min: 39, npc_id: anne.id
thief_attack_1 = Attack.create name: "throat slice", max: 50, min: 40, npc_id: lucas.id
thief_attack_2 = Attack.create name: "poison", max: 80, min: 20, npc_id: lucas.id
knight_attack_1 = Attack.create name: "Sword Dance", max: 60, min: 40, npc_id: jackson.id 
kngiht_attack_2 = Attack.create name: "Tackle", max: 20, min: 15, npc_id: jackson.id 
