Attack.destroy_all
Npc.destroy_all
Location.destroy_all

tavern = Location.create name: "Tavern"
farm = Location.create name: "Farm"
castle = Location.create name: "Castle"
dungeon = Location.create name: "Dungeon"

ulric = Npc.create name: "Ulric", character_class: "Wizard", ally: 0, location_id: tavern.id 
mantagu = Npc.create name: "Lord Mantagu", character_class: "Archer", ally: 0, location_id: tavern.id
borin = Npc.create name: "Borin", character_class: "Bard", ally: 0, location_id: tavern.id
merek = Npc.create name: "Merek", character_class: "Thief", ally: 0, location_id: farm.id
henry = Npc.create name: "Henry", character_class: "Farmer", ally: 0, location_id: farm.id
fenwick = Npc.create name: "Sir John Fenwick", character_class: "Knight", ally: 0, location_id: castle.id


wizard_attack_1 = Attack.create name: "Fireball", max: 40, min: 30, npc_id: ulric.id
wizard_attack_2 = Attack.create name: "Lightning", max: 60, min: 25, npc_id: ulric.id
archer_attack_1 = Attack.create name: "Arrow Storm", max: 65, min: 20, npc_id: mantagu.id
archer_attack_2 = Attack.create name: "Dagger Slash", max: 40, min: 39, npc_id: mantagu.id
bard_attack_1 = Attack.create name: "Guitar Smash", max: 35, min: 35, npc_id: borin.id
bard_attack_2 = Attack.create name: "Singing", max: 1, min: 0, npc_id: borin.id
thief_attack_1 = Attack.create name: "Back Stab", max: 65, min: 20, npc_id: merek.id
thief_attack_2 = Attack.create name: "Poison", max: 70, min: 10, npc_id: merek.id
farmer_attack_1 = Attack.create name: "Pichfork", max: 20, min: 15, npc_id: henry.id
farmer_attack_2 = Attack.create name: "Throw Torch", max: 50, min: 5, npc_id: henry.id
knight_attack_1 = Attack.create name: "Sword Dance", max: 90, min: 20, npc_id: fenwick.id 
kngiht_attack_2 = Attack.create name: "Tackle", max: 20, min: 5, npc_id: fenwick.id 
