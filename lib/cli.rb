class Cli 

  ActiveRecord::Base.logger = nil

  def prompt
    TTY::Prompt.new(symbols: {marker: '🛡'})
  end

  def pause
    print "            \n"
    print "Press any key to continue".colorize(:yellow)
    STDIN.getch
    print "            \r" # extra space to overwrite in case next sentence is short
  end 


  def spinner info
    spin= TTY::Spinner.new("[:spinner] Ariving at...", format: :dots)
    spin.auto_spin # Automatic animation with default interval
    sleep(2) # Perform task
    spin.stop("#{info}") # Stop animation
    sleep(0.5)
  end

  def play_music(file)
    @pid = spawn( 'afplay', file )
  end

  def switch_song 
    Process.kill "TERM", @pid
  end

  def start_game
    system('clear')
    play_music("lib/mp3/Fogweaver.mp3")
    Npc.all.each { |person| person.update(ally: 0)}
    welcome
  end


  def welcome
    system('clear')
    Ascii_art.title
    Ascii_art.castle
    puts "Welcome Adventurer"
    puts "Your quest is to slay the Dragon in the Dungeon."
    puts "However, the dragon is feace, and you will not be able take him on alone."
    puts "So go out, and find allies to join you in this quest!"
    ask = prompt.yes?("Whould you like to continue?")
    if ask 
      spinner("Menu")
      menu
    else 
      return
    end
  end

  def menu 
    system('clear')
    puts Ascii_art.menu
    menu_choices = ["List Allies", "List Attacks", "Go to Map", "Quit Game"]
    menu_choice = prompt.select("Welcome! What would you like to do?", menu_choices)
    if menu_choice == "Go to Map"
      spinner ("Map")
      list_locations
    elsif menu_choice == "List Allies"
      spinner("Allies list")
      if Npc.list_allies != []
        system('clear')
        Ascii_art.ally_list
        Npc.list_allies.each do |ally|
          puts "#{ally.name} the #{ally.character_class}"
        end
        pause
        menu
      else
        puts "You have no allies in your party currently!".colorize(:red)
        pause
        menu
      end
    elsif menu_choice == "List Attacks"
      spinner("Attacks List")
      allies_attacks = get_allies_attacks
      if allies_attacks != []
        system('clear')
        Ascii_art.attack_list
        allies_attacks.each do |attack|
          puts "#{attack.name} - Min Damage: #{attack.min} Max Damage:#{attack.max}"
        end
        pause
        menu
      else
        puts "You have no attacks currently".colorize(:red)
        pause
        menu
      end
    else
      exit_game
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

    Ascii_art.map
    Ascii_art.map_pic

    locations = Location.all.pluck(:name) << "Go to Menu" 
    location = prompt.select("Where would you like to go?", locations)
    if location == "Go to Menu"
      spinner ("Menu")
      menu
    end

    if location == "Dungeon"
      spinner("the Dungeon")
      switch_song 
      play_music("lib/mp3/dungeon.mp3")
      dungeon(location)
    end

    location = Location.find_location_by_name(location)
    spinner("the #{location.name}")
    switch_song 
    play_music(location.song)
    list_npcs(location)
  end

  def list_npcs place
    system('clear')
    puts "Welcome to the #{place.name}"
    puts place.image.colorize(:blue)

    npcs = place.npcs.pluck(:name) << "Go Back"
    npc = prompt.select("Who would you like to talk to?",  npcs)
    if npc == "Go Back"
      spinner("Map")
      switch_song 
      play_music("lib/mp3/Fogweaver.mp3")
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
    puts "Hello, my name is #{person.name}, the #{person.character_class}. What brings you to this #{location.name}?".colorize(:cyan)
    conversation = ["I am looking for those willing to join me in my fight against the Dragon. Will you join me in my quest?", "Just passing through"]

    if person.ally == 1
      conversation = ["I'm gonna need you to sit out this fight", "Just passing through"]
    else
      conversation = ["I am looking for those willing to join me in my fight against the Dragon. Will you join me in my quest?", "Just passing through"]
    end
    answer = prompt.select("What do you say?", conversation)
    if answer == "I am looking for those willing to join me in my fight against the Dragon. Will you join me in my quest?"
      puts "It would be my honor. I will join you".colorize(:cyan)
      person.update(ally: 1)
      puts "\n"
      puts "#{person.name} has joined your team!".colorize(:green)
      pause
      list_npcs place
    elsif  answer == "I'm gonna need you to sit out this fight"
      puts "I gotta say...I'm sad about your decision...but I understand".colorize(:cyan)
      person.update(ally: 0)
      puts "\n"
      puts "#{person.name} has left your team!".colorize(:red)
      pause
      list_npcs place
    else
      puts "Have a good day!".colorize(:cyan)
      pause
      list_npcs place
    end
  end


  @@dragon_health = 200
  @@dragon_damage_min = 10
  @@dragon_damage_max = 25
  @@player_health = 100


  def dungeon place
    system('clear')
    if Npc.list_allies == []
      puts "It is dangerous to go alone. Best find some allies to help you fight!"
      pause
      switch_song 
      play_music("lib/mp3/Fogweaver.mp3")
      menu 
    end

    puts Location.find_location_by_name(place).image
    ask = prompt.yes?("Are you sure you're ready to face the dragon?")
    if ask
      turn
    else
      switch_song 
      play_music("lib/mp3/Fogweaver.mp3")
      list_locations
    end
  end

  def turn

    puts "Your team is at #{@@player_health} health".colorize(:green)
    puts "The Dragon is at #{@@dragon_health} health".colorize(:red)
    puts "\n"
    sleep(3)

    attack = prompt.select("Choose attack", get_allies_attacks.pluck(:name))
    attack = Attack.gets_attack_by_name(attack)
    damage = rand(attack.min..attack.max)
    pid = fork{ exec 'afplay', attack.sound }
    puts "You did #{damage} damage to the Dragon!".colorize(:green)
    puts attack.image
    @@dragon_health = @@dragon_health - damage

    puts "\n"


    sleep(3)

    if @@dragon_health < 1
      puts "You have defeated the Dragon!"
      good_ending
    end

    dragon_damage = rand(@@dragon_damage_min..@@dragon_damage_max)
    pid = fork{ exec 'afplay', 'lib/mp3/dragon.mp3' }
    puts "Dragon dealt #{dragon_damage} damage to the group".colorize(:red)
    Ascii_art.dragon
    @@player_health = @@player_health - dragon_damage
    

    if @@player_health < 1
      Ascii_art.you_died
      pause
      bad_ending
    end
    puts "\n"
    sleep(2)
    # binding.pry
    pause
    turn
  end

  def good_ending 
    system('clear')
    Ascii_art.congradulations
    puts "Your team defeated the dragon with #{@@player_health} health left"
    exit_game
  end

  def bad_ending 
    system('clear')
    Ascii_art.gameover
    puts "I'm sorry... the dragon bested you and your team with #{@@dragon_health} health left"
    exit_game
  end

  def exit_game
    puts "Thanks for playing"
    @pid = fork{ exec 'killall', "afplay"}
    exit
  end
end