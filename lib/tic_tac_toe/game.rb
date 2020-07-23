module TicTacToe

  # La classe Game initialise le jeu avec 2 joueurs dont l'ordre est tiré au sort
  class Game

    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    # On change l'ordre des joueurs à chaque tour
    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    # On indique  quel joueur joue et ce qu'il doit faire
    def solicit_move
      "
      Merci à #{current_player.name} de choisir une position (de 1 à 9)
      "
    end

    # On intercepte la saisie du joueur et on regarde si c'est un choix valable
    def get_move(human_move = gets.chomp)
        while not ["1", "2", "3", "4", "5", "6", "7", "8", "9"].include?(human_move)
        sleep(1)
system('clear')        
        puts "___________________________________
            ┬┌─┐┬┌─┐
            │ ┌┘│ ┌┘
            o o o o 

     ▄██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█▄
    ███─────────────────────██
   ███───────────────────────██
  ███────▄▀▀▀▀▄─────▄▀▀▀▀▄────██
 ████──▄▀──────▀▄─▄▀──────▀▄──███
 ████───▄██████─────██████▄───███
█████──██▓▓▓▓▓██───██▓▓▓▓▓██──█████
█████──██▓▓█▓▓██───██▓▓█▓▓██──█████
█████──██▓▓▓▓▓█▀─▄─▀█▓▓▓▓▓██──█████
████▀──▀▀▀▀▀▀▀▀─▄█▄─▀▀▀▀▀▀▀▀──▀████
███─▄▀▀▀▄──────█████──────▄▀▀▀▄─███
███──▄▀▄─█────███████────█─▄▀▄──███
███─█──█─█────███████────█─█──█─███
███─█─▀──█───▄███████▄───█──▀─█─███
███▄─▀▀▀▀────█─▀███▀─█────▀▀▀▀─▄███
████───────────────────────────████
 ███─────▀████████████████▀─────██
 ███─────────█───────█────────███
   ████─────█─────────█──────████
     ███▄──█────███────█───▄███
       ▀█████▄▄█████▄▄███████▀
              █     █
     ╔═╗╔╦╗╔╦╗╔═╗╔╗╔╦╗╦╔═╗╔╗╔
     ╠═╣ ║  ║ ║╣ ║║║║ ║║ ║║║║
     ╩ ╩ ╩  ╩ ╚═╝╝╚╝╩ ╩╚═╝╝╚╝   
            ┬┌─┐┬┌─┐
            │ ┌┘│ ┌┘
            o o o o 
      **********************
   !!!! ON A DIT DE 1 à 9 !!!!
      **********************
___________________________________"

        human_move = gets.chomp
        end

    human_move_to_coordinate(human_move)
    end

    # On prévient en cas de fin de partie
    def game_over_message
      sleep(2)
system('clear')
      return "______________
╔╗ ╦═╗╔═╗╦  ╦╔═╗
╠╩╗╠╦╝╠═╣╚╗╔╝║ ║
╚═╝╩╚═╩ ╩ ╚╝ ╚═╝
*****************
#{current_player.name} !
*****************
╔╦╗╦ ╦  ╔═╗╔═╗ 
 ║ ║ ║  ╠═╣╚═╗ 
 ╩ ╚═╝  ╩ ╩╚═╝ 
╔═╗╔═╗╔═╗╔╗╔╔═╗
║ ╦╠═╣║ ╦║║║║╣ 
╚═╝╩ ╩╚═╝╝╚╝╚═╝
______________" if board.game_over == :winner
      sleep(2)
system('clear')
      return "_________________________________________________

                                                  
                     'cxOOxc'                     
                  ':d0NWWWWNKxc'                  
                ;oONWWWWWWWWWWN0d:'               
             ;oOXWWWNOdddoodkXWWWN0d:             
          ;lkXWWWWNOookK0kdollxXWWWWXOo;          
       ,lkXWWWWWWNxckNWWXOkdxd:lKWWWWWWXOo;       
    ,ckKWWWWWWWWNdc0WWWWXOxdddo;:KWWWWWWWWXkl,    
 'cxKNWWWWWWWWWNd:kXK0OOxdlcllol;cKWWWWWWWWWWKkc, 
'dNWWWWWWWWWWWWk,,;;clcccccccc;'''lXWWWWWWWWWWWWk,
 cXWWWWWWWWWWWXl   'xNWWKkKNW0;   ,OWWWWWWWWWWWNo 
  dNWWWWWWWWWWWKl'  ;OWWNXXWXl   ;kNWWWWWWWWWWWk' 
  ,OWWWWWWWWWN0d:    ,ldxkxo:    ,oOXWWWWWWWWW0;  
   cXWWWWWWWKl'''''''''''''''''''''';kNWWWWWWNl   
    dNWWWWWK: ,kKKKK0KKK00K00K0KKK0c 'kWWWWWWx'   
    ,OWWWWXl  ;0WWWWWWWWWWWWWNWWWWNl  ;OWWWW0;    
     cKWWNd'  ,OWWWWKkkO0X0kOkONWWXl   cKWWXl     
      dNWXc   ,OWWWWNkOkx0xldO0NWWXc   'kWWx'     
      ,OWNx,  'kWWWWNXXXXWNKKWWWWWK:   lXM0;      
       ;dxdc' 'xXXXXXXXXXXXXXXXXXX0;  ;oxd:       
        :kOO0d,:ooooooooooooooooooc,cOOOOc        
        ,kWWWXdodddddddddddddddddxdo0WWW0;        
         ;dxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:         
              ╔═╗╔═╗╔═╗╦  ╦╔╦╗╔═╗   
              ║╣ ║ ╦╠═╣║  ║ ║ ║╣    
              ╚═╝╚═╝╩ ╩╩═╝╩ ╩ ╚═╝   
             ╔═╗╔═╗╦═╗╔═╗╔═╗╔╗╔╗╔╔═╗
             ╠═╝║╣ ╠╦╝╚═╗║ ║║║║║║║╣ 
             ╩  ╚═╝╩╚═╚═╝╚═╝╝╚╝╚╝╚═╝
             ╔╗╔╔═╗  ╔═╗╔═╗╔═╗╔╗╔╔═╗
             ║║║║╣   ║ ╦╠═╣║ ╦║║║║╣ 
             ╝╚╝╚═╝  ╚═╝╩ ╩╚═╝╝╚╝╚═╝
_________________________________________________" if board.game_over == :draw
    end

    # On indique qui commence à jouer
    def play
      puts "________________________
╔═╗╗╔═╗╔═╗╔╦╗
║   ║╣ ╚═╗ ║ 
╚═╝ ╚═╝╚═╝ ╩ 
**********************
#{current_player.name}!!
**********************
╔═╗ ╦ ╦ ╦
║ ║ ║ ║ ║
╚═╬ ╚═╝ ╩ 
╔═╗╔═╗╔╦╗╔╦╗╔═╗╔╗╔╔═╗╔═╗
║  ║ ║║║║║║║║╣ ║║║║  ║╣ 
╚═╝╚═╝╩ ╩╩ ╩╚═╝╝╚╝╚═╝╚═╝
________________________"
      sleep(1)

      # On lance la grille vide et l'invitation au jeu, ou le message de fin de partie, ou en change le joueur en cours
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.color)
        if board.game_over
          board.formatted_grid
          puts game_over_message
          return
        else
          switch_players
        end
      end
    end

    private

    # On traduit les coordonnées en nombre
    def human_move_to_coordinate(human_move)
      mapping = {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2]
      }
      mapping[human_move]
    end

  end
end
