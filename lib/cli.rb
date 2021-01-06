class Cli 

  ActiveRecord::Base.logger = nil

  def prompt
    TTY::Prompt.new(symbols: {marker: '🛡'})
  end


  def spinner 
    spin= TTY::Spinner.new("[:spinner] Loading ...", format: :dots)
    spin.auto_spin # Automatic animation with default interval
    sleep(2) # Perform task
    spin.stop("Done!") # Stop animation
  end

  def start_game
    system('clear')
    Npc.all.each { |person| person.update(ally: 0)}
    welcome
  end


  def welcome
    system('clear')
    Ascii_art.title
    Ascii_art.castle
    puts "Welcome Adventurer"
    puts "Your quest is to slay the dragon in the dungeon"
    puts "However, the dragon is tough, and you will not be able to do it alone"
    puts "So go out and find allies to heed you in the quest"
    ask = prompt.yes?("Whould you like to continue?")
    if ask 
      spinner
      menu
    else 
      return
    end
  end

  def menu 
    system('clear')
    puts Ascii_art.menu
    menu_choices = ["List Allies", "List Attacks", "Go to Locations", "Quit Game"]
    menu_choice = prompt.select("Welcome! What would you like to do?", menu_choices)
    if menu_choice == "Go to Locations"
      spinner
      list_locations
    elsif menu_choice == "List Allies"
      spinner
      if Npc.list_allies != []
        puts Npc.list_allies.pluck(:name)
        sleep(2)
        menu
      else
        puts "no current allies"
        sleep(2)
        menu
      end
    elsif menu_choice == "List Attacks"
      spinner
      if get_allies_attacks != []
        puts get_allies_attacks.pluck(:name, :max, :min)
        sleep(2)
        menu
      else
        puts "no current attacks"
        sleep(2)
        menu
      end
    else
      exit
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

    locations = Location.all.pluck(:name) << "Go to Menu" 
    location = prompt.select("Where would you like to go?", locations)
    if location == "Go to Menu"
      spinner
      menu
    end

    if location == "Dungeon"
      spinner
      dungeon(location)
    end

    location = Location.find_location_by_name(location)
    spinner
    list_npcs(location)
  end

  def list_npcs place
    system('clear')
    puts "Welcome to the #{place.name}"
    puts place.image
    sleep(2)
    npcs = place.npcs.pluck(:name) << "Go Back"
    npc = prompt.select("Who do you want to talk to?",  npcs)
    if npc == "Go Back"
      spinner
      list_locations
    end
    npc = Npc.all.find{ |person| person.name == npc}
    dialog(npc, place)
    binding.pry
  end

  def dialog person, place
    system('clear')
    location = person.location
    puts person.image
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
      puts "#{person.name} has joined your team!"
      sleep(2)
      list_npcs place
    elsif  answer == "I'm gonna need you to sit out this fight"
      puts "I gotta say I'm sad about your decision, but I understand"
      person.update(ally: 0)
      puts "#{person.name} has left your team!"
      sleep(2)
      list_npcs place
    else
      puts "Have a good day!"
      sleep(2)
      list_npcs place
    end
  end


  @@dragon_health = 200
  @@dragon_damage_min = 10
  @@dragon_damage_max = 25
  @@player_health = 100


  def dungeon place
    if Npc.list_allies == []
      puts "It is dangerous to go alone. Best find some allies to help you fight!"
      sleep(2)
      menu 
    end

    puts Location.find_location_by_name(place).image
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
    puts attack.image
    @@dragon_health = @@dragon_health - damage


    sleep(2)

    if @@dragon_health < 1
      puts "You have defeated the Dragon!"
      good_ending
    end

    dragon_damage = rand(@@dragon_damage_min..@@dragon_damage_max)
    puts "Dragon dealt #{dragon_damage} damage to the group"
    Ascii_art.dragon
    @@player_health = @@player_health - dragon_damage
    

    if @@player_health < 1
      puts "You have died"
      bad_ending
    end

    sleep(2)
    # binding.pry
    turn
  end

  def good_ending 
    system('clear')
    puts "Congradulations! Your team defeated the dragon with #{@@player_health} health left"
    exit_game
  end

  def bad_ending 
    system('clear')
    puts "I'm sorry... the dragon bested you and your team with #{@@dragon_health} health left"
    exit_game
  end

  def exit_game
    puts "Thanks for playing"
    exit
  end
end