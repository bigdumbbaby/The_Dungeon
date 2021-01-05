class Cli 

  ActiveRecord::Base.logger = nil

  def prompt
    TTY::Prompt.new
  end

  def start_game
    system('clear')
    Npc.all.each { |person| person.update(ally: 0)}
    welcome
  end

  def welcome
    system('clear')
    puts Dragon.dragon 
    binding.pry

    puts "Welcome Adventurer"
    puts "Your quest is to slay the dragon in the dungeon"
    puts "However, the dragon is tough, and you will not be able to do it alone"
    puts "So go out and find allies to heed you in the quest"
    ask = prompt.yes?("Whould you like to continue?")
    if ask 
      list_locations
    else 
      return
    end
  end


  def get_allies_attacks
    system('clear')
    allies = Npc.list_allies
    attacks = []
    allies.each {|ally| attacks << ally.get_attacks}
    attacks.flatten
  end

  def list_locations
    system('clear')

    locations = Location.all.pluck(:name) << "Go Back" 
    locations << "List Allies"
    locations << "List Attacks"
    location = prompt.select("Where would you like to go?", locations)
    if location == "Go Back"
      welcome
    end

    if location == "List Allies"
      puts Npc.list_allies.pluck(:name)
      #binding.pry
      list_locations
    end
    if location == "List Attacks"
      attacks = get_allies_attacks
      puts attacks.pluck(:name, :max, :min)
      list_locations
    end

    if location == "Dungeon"
      dungeon
    end

    location = Location.all.find{ |place| place.name == location}
    list_npcs(location)
  end

  def list_npcs place
    system('clear')

    npcs = place.npcs.pluck(:name) << "Go Back"
    npc = prompt.select("Who do you want to talk to?",  npcs)
    if npc == "Go Back"
      list_locations
    end
    npc = Npc.all.find{ |person| person.name == npc}
    dialog(npc, place)
    binding.pry
  end

  def dialog person, place
    system('clear')

    location = person.location
    puts "Hello, my name is #{person.name}, the #{person.character_class}. What brings you to this #{location.name}?"
    conversation = ["Will you join me on my quest to defeat the dragon?", "Just passing through"]

    if person.ally == 1
      conversation = ["I'm gonna need you to sit out this fight", "Just passing through"]
    else
      conversation = ["Will you join me on my quest to defeat the dragon?", "Just passing through"]
    end
    answer = prompt.select("What do you say?", conversation)
    if answer == "Will you join me on my quest to defeat the dragon?"
      puts "I would love to join"
      person.update(ally: 1)
      list_npcs place
    elsif  answer == "I'm gonna need you to sit out this fight"
      "I gotta say I'm sad about your decision, but I understand"
      person.update(ally: 0)
      list_npcs place
    else
      puts "Have a good day!"
      list_npcs place
    end
  end

  @@dragon_health = 200
  @@dragon_damage_min = 10
  @@dragon_damage_max = 25
  @@player_health = 100


  def dungeon

    ask = prompt.yes?("Are you sure you're ready to face the dragon?")
    if ask
      turn
    else
      list_locations
    end
  end

  def turn

    puts "Your team is at #{@@player_health} health"
    puts "The Dragon is at #{@@dragon_health} health"

    sleep(2)

    attack = prompt.select("Choose attack", get_allies_attacks.pluck(:name))
    attack = Attack.gets_attack_by_name(attack)
    damage = rand(attack.min..attack.max)
    puts "You did #{damage} damage to the Dragon!"
    @@dragon_health = @@dragon_health - damage


    sleep(2)

    if @@dragon_health < 1
      puts "You have defeated the Dragon!"
      exit_game
    end

    dragon_damage = rand(@@dragon_damage_min..@@dragon_damage_max)
    puts "Dragon dealt #{dragon_damage} damage to the group"
    @@player_health = @@player_health - dragon_damage
    

    if @@player_health < 1
      puts "You have died"
      exit_game
    end

    sleep(3)
    # binding.pry
    turn
  end

  def exit_game
    puts "Thanks for playing"
    exit
  end
end