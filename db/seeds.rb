Attack.destroy_all
Npc.destroy_all
Location.destroy_all


tavern_image = "
_______________________________________________________________________________
                          .-|-|----------------|-|-.
                          |                        |_
                     .--~~|        Tavern          | ~~--.
                     |    |                        |     |
                     |    `-.____________________.-'     |
_______________      |                                   |
     |         |     |                                   |
  /  |   /  /  |     |                                   |
/    |     /   |     | _______                   _______ |
_____|_________|     ||       ~---_         _---~       ||
     |    /    |     ||           ~---. .---~           ||
 / / |         |     ||               | |               ||
  /  |  /   /  |     ||               | |               ||
_____|_________|     ||               | |               ||
---------------'     ||               | |               ||
                     ||               | |               ||
                     ||               | |               ||
                     ||           .---' `---.           ||
                     |`.______.---'         `---.______.'|
               ______|                                   |______
--------~~~~~~~                                                 ~~~~~~~--------
"
farm_image = "

                            +&-
                           _.-^-._    .--.
                        .-'   _   '-. |__|
                       /     |_|     ||  |
                      /               |  |
                     /|     _____     || |
                      |    |==|==|    |  |
  |---|---|---|---|---|    |--|--|    |  |
  |---|---|---|---|---|    |==|==|    |  |
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"

castle_image = "
                                        |>>>                        |>>>
                                        |                           |
                                    _  _|_  _                   _  _|_  _
                                  | |_| |_| |                 | |_| |_| |
                                  |  .      /                 | .    .  /
                                    |    ,  /                   |    .  /
                                    | .   |_   _   _   _   _   _| ,   |
                                    |    .| |_| |_| |_| |_| |_| |  .  |
                                    | ,   | .    .     .      . |    .|
                                    |   . |  .     . .   .  ,   |.    |
                        ___----_____| .   |.   ,  _______   .   |   , |---~_____
                    _---~            |     |  .   /+++++++|    . | .   |         ~---_
                                    |.    | .    |+++++++| .    |   . |              ~-_
                                  __ |   . |   ,  |+++++++|.  . _|__   |                 ~-_
                        ____--`~    '--~~__ .    |++++ __|----~    ~`---,              ___^~-__
                    -~--~                   ~---__|,--~'                  ~~----_____-~'   `~----~
"

dungeon_image = "
                  _________________
             ____/################# ____
         ___/################,########## ___
       _/################/##/  ## ########## _
      /#################/ ##| |##/ ###########|
     /##################   #| |#/ /############|
    |####################   | |/ /#########JRB##|
    |################### {{{ /}}}##############|
    |################## {{<.> <.>}}#############|
    |#################### { | | }###############|
    |#################### { | | }####_#######__#|
    |#####################/_| |_  #_( )###__(  )_
    |################### {(_)_(_)}(  ` )_( '__ ` )
    |#################### {VV_VV}##(__( `)_(  )-` )
    |##################### ^^))^/######(   )_')  )
    |######################--((-########( ' _)__)
    |########################))##########(__)###|
    |########################(##################|
    |###########################################|
    |###########################################|
    |###########################################|
    |###########################################|
  | /########| |################################|   | /
_ |/|#######/    #################### |/########|__ |/___
                /
               /
              V"

tavern = Location.create name: "Tavern", image: tavern_image
farm = Location.create name: "Farm", image: farm_image
castle = Location.create name: "Castle", image: castle_image
dungeon = Location.create name: "Dungeon", image: dungeon_image

ulric_image = "
                  .
                   .
         /^|     .
    /|    V
   /__|   I      O  o
  //..||  I     .
  |].`[/  I
  /l|/j|  (]    .  O
 /. ~~ ,|/I          .
 ||L__j^|/I       o
  |/--v}  I     o   .
  |    |  I   _________
  |    |  I c(`       ')o
  |    l  I   |.     ,/
_/j  L l|_!  _//^---^||_  
"

mantagu_image = "
                                                       |
                                                        |.
                                                        /|.
                                                      /  `|.
                                                    /     |.
                                                  /       |.
                                                /         `|.
                                              /            |.
                                            /              |.
                                          /                |.
     __                                 /                  `|.
      -|                              /                     |.
        ||                          /                       |.
          ||                      /                         |.
           ||                   /                           ||
             |#####|          /                             ||
         ==###########>     /                               ||
          |##==      |    /                                 ||
     ______ =       =|__/___                                ||
 ,--' ,----`-,__ ___/'  --,-`-==============================##==========>
|               '        ##_______ ______   ______,--,____,=##,__
 `,    __==    ___,-,__,--'#'  ==='      `-'              | ##,-/
   `-,____,---'       |####|              |        ____,--|_##,/
       #_              |##   |  _____,---==,__,---'         ##
        #              ]===--==|                            ||
        #,             ]         |                          ||
         #_            |           |                        ||
          ##_       __/'             |                      ||
           ####='     |                |                    |/
            ###       |                  |                  |.
            ##       _'                    |                |.
           ###=======]                       |              |.
          ///        |                         |           ,|.
          //         |                           |         |.
                                                   |      ,|.
                                                     |    |.
                                                       |  |.
                                                         ||.
                                                         /.
                                                        |
"

borin_image = "
          ((~
         ,))))))),
         )))'`')))
         (( ',' ))
          {; = ;}
     |||  /`'v'`|  ///
      /''`|_/o|_/`''|
     /ooo    |    ooo|
    /===/    |    |===|
   /ooo/     |     |ooo|
  /===(      |      )===|
 /ooooo|_____|_____/ooooo|
/_______|===(E)===/_______|
   (()(~~~~~~~~~~~~~)())
       |           /
       |    /^|    |
       |oooo| |oooo|
       |====| |====|
       )oooo| |oooo(
      /=====| |=====|
     /oooooo| |oooooo|
    /_______| |_______|
        (__)   (__)
         ~~     ~~
"

merek_image = "
                       __.------.
                      (__  ___   )
                        .)e  )| /
                       /_.------
                       _/_    _/
                   __.'  / '   `-.__
                  / <.--'           `|
                 /   |   |c           |
                /    /    )  GoT  x    |
                |   /|    |c     / |.-  |
                |__/  )  /(     (   |   <>'|
                     / _/ _|-    `-. |/_|_ /<>
                    / /--/,-|     _ |     <>.`.
                    |/`--|_._) - /   `-/|    `.|
                     /        `.     /   )     `|
                     |      |   |___/----'
                     |      /    `(
 ___________         |    ./|_   _ |
   ______________    /     |  )    '|
 __________________ |     /   |     |     ___________a:f
                   /     |     |____.)
                  /      |  a88a|___/88888a.
                 |_      :)8888888888888888888a.
                /` `-----'  `Y88888888888888888
                |____|         `88888888888P'
"

henry_image = "
        ░░░░░░░░                    
      ░░░░░░░░░░░░                  
      ░░░░░░░░░░░░                  
    ░░░░░░░░░░░░░░░░      ▒▒      ▒▒
░░░░░░░░░░░░░░░░░░░░░░░░  ▒▒  ▒▒  ▒▒
    ░░░░██░░░░██░░░░      ▒▒  ▒▒  ▒▒
    ░░░░░░░░░░░░░░░░      ▒▒  ▒▒  ▒▒
    ░░░░░░████░░░░░░      ▒▒  ▒▒  ▒▒
    ░░░░░░░░░░░░░░░░      ▒▒▒▒▒▒▒▒▒▒
      ░░░░░░░░░░░░          ▒▒▒▒▒▒  
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ▒▒    
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▒▒    
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▒▒    
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓░░▒▒    
░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓░░░░    
░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ░░░░░░    
░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓          ▒▒    
░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓    ▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓    ▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓    ▓▓▓▓▓▓          ▒▒    
    ▓▓▓▓▓▓    ▓▓▓▓▓▓          ▒▒    
  ████████    ████████              
  ████████    ████████
"

fenwick_image = "
,   A           {}
/ |, | ,        .--.
|    =|= >     /.--.|
| /` | `       |====|
 `   |         |`::`|  
     |     .-;`|..../`;_.-^-._
    /||/  /  |...::..|`   :   `|
    |:'| |   /'''::''|   .:.   |
     | /|;-,/|   ::  |..:::::..|
     || <` >  >._::_.| ':::::' |
     | `""`  /   ^^  |   ':'   |
     |       |       |    :    /
     |       |        |   :   / 
     |       |___/|___|`-.:.-`
     |        |_ || _/    `
     |        <_ >< _>
     |        |  ||  |
     |        |  ||  |
     |       _|.:||:./_
     | jgs  /____/|____|
"

ulric = Npc.create name: "Ulric", character_class: "Wizard", ally: 0, image: ulric_image, location_id: tavern.id 
mantagu = Npc.create name: "Lord Mantagu", character_class: "Archer", ally: 0, image: mantagu_image, location_id: tavern.id
borin = Npc.create name: "Borin", character_class: "Bard", ally: 0, image: borin_image, location_id: tavern.id
merek = Npc.create name: "Merek", character_class: "Thief", ally: 0, image: merek_image, location_id: farm.id
henry = Npc.create name: "Henry", character_class: "Farmer", ally: 0, image: henry_image, location_id: farm.id
fenwick = Npc.create name: "Sir John Fenwick", character_class: "Knight", ally: 0, image: fenwick_image, location_id: castle.id


fireball_image = "
     _.-^^---....,,--       
 _--                  --_  
<                        >)
|                         | 
 |._                   _./  
    ```--. . , ; .--'''       
          | |   |             
       .-=||  | |=-.   
       `-=#$%&%$#=-'   
          | ;  :|     
 _____.,-#%&$@%#&#~,._____
"
lightnign_image = "
     _, .--.
    (  / (  '-.
    .-=-.    ) -.
   /   (  .' .   |
   | ( ' ,_) ) |_/
    (_ , /|  ,_/
      '--| `|--`
         _| _|
         `| |
          _|_|
          `||
            ||
        -.'.`|.'.-
"
arrow_image = "
>>>>>>>_____________________|`-._
>>>>>>>                     /.-'
>>>>>>>_____________________|`-._
>>>>>>>                     /.-'
"
dagger_image = "

                                  _____________________________
                           _.-''``------------------------|`. |``''--..__
                      _.-'` ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' | : |          ``'';';--..__
                 _.-'`                                    | : |         '   :';       ```';
            _.-'`                           ________/|_/|_|.'_|_       '   :';           /
       _.-'`                         _.-''``                    ``''--:.__;';           _|
     .'`                        _.-'`                                     `'`''-._     /
   .`                       _.-'                                                  `'-./
 .'                    _.-'`
/               __..-'`
``'''----'''````
"
guitar_image = "
                                       ...----~~~~~~~~--,
                                  ,:~""                  `.
                               ,-$                         |
   GG ________________________//"                          '|
   I;H:::::::::::::::::::::::::::::::::::::::&@;;@&::::I   $|
   I;H::::::::::::::::::::::::::::::::::::::&*!;;!*&:::I   $I
   I;H:::::::::::::::::::::::::::::::::::::::&@;;@&::::I   $|
   GG/~~~~~~~~~~~~~~~~~~~~~~~~ |,              ~~      ~   ,|
                               "-$                        //
                                 `:..                    ,'
                                     "
"
singing_image = "
||
|--|/----------------,~|------------(_)--
|--|---4-------------|~'------------|---
|-/|.-------|~~~~|--/|-----|~~~~|--/|--
|(-|-)-4---_|---_|--||----_|---_|--||-
|-`|'-----(_)--(_)-------(_)--(_)--
"
backstab_image = "
       .---.
       |---|
       |---|
       |---|
   .---^ - ^---.
   :___________:
      |  |//|
      |  |//|
      |  |//|
      |  |//|
      |  |//|
      |  |//|
      |  |.-|
      |.-'**|
       |***/
        |*/
         V

        '
         ^'
        (_)



    -.   ^   .-
______|'.|.'/________
"
poison_image = "
             {_________}
              )=======(
             /         |
            | _________ |
            ||   _     ||
            ||  |_)    ||
            ||  | |/   ||
      __    ||    /|   ||
 __  (_|)   |'---------'|
(_|)     jgs`-.........-'
"
pitchfork_image = "
                                                         .+====----->
                                                          |('
====================================================<%{%{%{>>+===--->
                                                          /(,
                                                         ,+====----->
"
torch_image = "
           /|
        /|/ |/|
        |  ^   | /|  /|
  (|/|  / ^   /|/  )/^ )
   |  |/^ /|       ^  /
    )^       ^ |     (
   (   ^   ^      ^|  )
    |___|/____/______/
    [________________]
     |              |
     |     //||     |
     |    <<()>>    |
     |     ||//     |
      |____________/
          |    |
          |    |
          |    |
          |    |
          |    |
          |    |
          |    |
"
sword_image = "
                   /}
                  //
                 /{     />
  ,_____________///----/{____________________________________________________
/|=============|/||-----/____________________________________________________|
||=============||/|-----|____________________________________________________/
  '~~~~~~~~~~~~~|||----|{
                 |{     |>
                  ||
                   |}
"
tackle_image = "
              .-'||'-.
            .'   ||   '.
           /   __||__   |
           | /`-    -`| |
           | | 6    6 | |
           |/|____7___/|/
   .--------:|:I:II:I:/;--------.
  /          |`:I::I:`/          |
 |            `------'            |
 |             |____/             |
 |      ,     __   _____   ,      |
 |======|    / /  /  _  |  |======|
 |======|   / /__ | <_> /  |======|
 |~~~~~|   | <_> |/ <_> |   |~~~~~|
 |     ||   |____/|_____/  /|     |
  |    ||                  |/    /
  `|    |  _ _.-=""=-._ _  /    /'
    |   '`_)||-++++-//(_`'   /'
jgs   ;   (__||      ||__)   ;
       ;   ___|      /___   ;
        '. ---/-=..=-|--- .'
          `""`        `""`
"


wizard_attack_1 = Attack.create name: "Fireball", max: 40, min: 30, image: fireball_image, npc_id: ulric.id
wizard_attack_2 = Attack.create name: "Lightning", max: 60, min: 25, image: lightnign_image, npc_id: ulric.id
archer_attack_1 = Attack.create name: "Arrow Storm", max: 65, min: 20, image: arrow_image, npc_id: mantagu.id
archer_attack_2 = Attack.create name: "Dagger Slash", max: 40, min: 39, image: dagger_image, npc_id: mantagu.id
bard_attack_1 = Attack.create name: "Guitar Smash", max: 35, min: 35, image: guitar_image, npc_id: borin.id
bard_attack_2 = Attack.create name: "Singing", max: 1, min: 0, image: singing_image, npc_id: borin.id
thief_attack_1 = Attack.create name: "Back Stab", max: 65, min: 20, image:backstab_image, npc_id: merek.id
thief_attack_2 = Attack.create name: "Poison", max: 70, min: 10, image: poison_image, npc_id: merek.id
farmer_attack_1 = Attack.create name: "Pichfork", max: 20, min: 15, image: pitchfork_image, npc_id: henry.id
farmer_attack_2 = Attack.create name: "Throw Torch", max: 50, min: 5, image: torch_image, npc_id: henry.id
knight_attack_1 = Attack.create name: "Sword Dance", max: 90, min: 20, image: sword_image, npc_id: fenwick.id 
kngiht_attack_2 = Attack.create name: "Tackle", max: 20, min: 5, image: tackle_image, npc_id: fenwick.id 