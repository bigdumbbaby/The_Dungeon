# The Dungeon
> The new RPG you have been looking for!!!



## General info
The Dungeon is a CLI application that allows users to jump into a RPG style game straight out of the 1970's.
Jump into the game and find yourself with a quest to fight the the all mighty dragon. But first you will need to find allies to join you on the great challenge ahead.

## Intro Video
[The Dungeon on YouTube]()

## Technologies
* Ruby - version 2.6.5
* ActiveRecord - version 6.0
* Rake - version 13.0
* Sinatra-activerecord - version 2.0
* SQLite3 - version 1.4
* tty-prompt - version 0.23.0
* tty-spinner - version 0.9.3
* colorize - version 0.8.1


## Setup
To run this project, first, install it locally by typing the following in the terminal:
```
git clone https://github.com/bigdumbbaby/mod1_project
```
Then CD into the repository and run the following:
```
rake db:migrate
rake db:seed
```
Then run the game with: 
```
ruby runner.rb
```

## Code Examples
```
def get_allies_attacks
    system('clear')
    allies = Npc.list_allies
    attacks = []
    allies.each {|ally| attacks << ally.get_attacks}
    attacks.flatten
  end
```
```
attack = prompt.select("Choose attack", get_allies_attacks.pluck(:name))
    attack = Attack.gets_attack_by_name(attack)
    damage = rand(attack.min..attack.max)
    pid = fork{ exec 'afplay', attack.sound }
    puts "You did #{damage} damage to the Dragon!".colorize(:green)
    puts attack.image
    @@dragon_health = @@dragon_health - damage

    puts "\n"


    sleep(3)
```



## Features
* Gain allies
* See who your allies are
* See what attacks you have 
* Use the map to travel to multiple locations
* Interact with multiple NPCs
* Use NPC's attacks to deal damage to the dragon


To-do list:
* Refactor code
* Create larger API to include more locations, NPCs, and attacks.
* Create more robust combat system 


## Status
Project functions as intended, more room for improvement 


## Inspiration
Early classic RPG 


## Contact
Created by [Brett Needham](https://github.com/brettneedham88) and [Colton O'Connor](https://www.linkedin.com/in/colton-o-connor/)



