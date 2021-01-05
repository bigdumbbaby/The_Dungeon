class Cli 
  def prompt
    TTY::Prompt.new
  end
  def welcome
    system('clear')
    puts "WELCOME TO THE GAME!!!"
    ask = prompt.yes?("Whould you like to see the NPCs")
    if ask 
      list_npcs
    else 
      puts "Too bad"
      welcome
    end
  end

  def list_npcs 
    npcs = prompt.multi_select("NPCs", Npc.all.pluck(:name))
  end
end