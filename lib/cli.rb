class Cli 
  def prompt
    TTY::Prompt.new
  end
  def welcome
    system('clear')
    puts "Welcome Adventurer"
    puts "Your quest is to slay the dragon in the dungeon"
    puts "However, the dragon is tough, and you will not be able to do it alone"
    puts "So go out and find allies to heed you in the quest"
    ask = prompt.yes?("Whould you like to continue?")
    if ask 
      list_locations
    else 
      puts "Too bad"
      welcome
    end
  end

  def list_locations
    location = prompt.select("Where would you like to go?", Location.all)
    list_npcs(location)
  end

  def list_npcs place
    prompt.select("Who do you want to talk to?",  Npc.all.select{ |npc| npc.location_id == place.id}.pluck(:name))
    binding.pry
  end

end