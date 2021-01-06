class Ascii_art 
  def self.castle 
    puts "
                                        |>>>                        |>>>
                                        |                           |
                                    _  _|_  _                   _  _|_  _
                                  | |_| |_| |                 | |_| |_| |
                                  \  .      /                 \ .    .  /
                                    \    ,  /                   \    .  /
                                    | .   |_   _   _   _   _   _| ,   |
                                    |    .| |_| |_| |_| |_| |_| |  .  |
                                    | ,   | .    .     .      . |    .|
                                    |   . |  .     . .   .  ,   |.    |
                        ___----_____| .   |.   ,  _______   .   |   , |---~_____
                    _---~            |     |  .   /+++++++\    . | .   |         ~---_
                                    |.    | .    |+++++++| .    |   . |              ~-_
                                  __ |   . |   ,  |+++++++|.  . _|__   |                 ~-_
                        ____--`~    '--~~__ .    |++++ __|----~    ~`---,              ___^~-__
                    -~--~                   ~---__|,--~'                  ~~----_____-~'   `~----~".colorize(:blue)
  end

  def self.title
    puts "
    ███        ▄█    █▄       ▄████████      ████████▄  ███    █▄  ███▄▄▄▄      ▄██████▄     ▄████████  ▄██████▄  ███▄▄▄▄   
▀█████████▄   ███    ███     ███    ███      ███   ▀███ ███    ███ ███▀▀▀██▄   ███    ███   ███    ███ ███    ███ ███▀▀▀██▄ 
   ▀███▀▀██   ███    ███     ███    █▀       ███    ███ ███    ███ ███   ███   ███    █▀    ███    █▀  ███    ███ ███   ███ 
    ███   ▀  ▄███▄▄▄▄███▄▄  ▄███▄▄▄          ███    ███ ███    ███ ███   ███  ▄███         ▄███▄▄▄     ███    ███ ███   ███ 
    ███     ▀▀███▀▀▀▀███▀  ▀▀███▀▀▀          ███    ███ ███    ███ ███   ███ ▀▀███ ████▄  ▀▀███▀▀▀     ███    ███ ███   ███ 
    ███       ███    ███     ███    █▄       ███    ███ ███    ███ ███   ███   ███    ███   ███    █▄  ███    ███ ███   ███ 
    ███       ███    ███     ███    ███      ███   ▄███ ███    ███ ███   ███   ███    ███   ███    ███ ███    ███ ███   ███ 
   ▄████▀     ███    █▀      ██████████      ████████▀  ████████▀   ▀█   █▀    ████████▀    ██████████  ▀██████▀   ▀█   █▀  
                                                                                                                            
    ".colorize(:red)
  end

  def self.dragon

    puts "
                   ___====-_  _-====___
           _--^^^#####//        #####^^^--_
        _-^##########// (    )   ##########^-_
       -############//  | ^^/|    ############-
     _/############//   (@::@)     ############ _
    /#############((       //     ))############# 
   -###############      (oo)    //###############-
  -#################    / VV    //#################-
 -###################  /       //###################-
_#/|##########/ ######(   /    )######/ ##########| #_
|/ |#/ #/ #/ /   #/ ##   |  |  /##/ #/   / #/ #/ #|  |
`  |/  V  V  `   V   # | |  | |/#/  V   '  V  V   |  '
   `   `  `      `   / | |  | |     '      '  '   '
                    (  | |  | |  )
                   __  | |  | | /__
                  (vvv(VVV)(VVV)vvv)".colorize(:green)
  end

  def self.sword 
    puts "
    />
    /<
   /<
|\_______{o}----------------------------------------------------------_
[\\\\\\\\\\\{*}:::<=============================================-       >
|/~~~~~~~{o}----------------------------------------------------------~
   \<
    \<
     \>".colorize(:red)
  end

  def self.menu
    puts "
    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
    ████╗ ████║██╔════╝████╗  ██║██║   ██║
    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝"
  end



end