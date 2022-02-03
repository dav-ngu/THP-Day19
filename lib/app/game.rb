#Game : s'occupe de gérer toute la partie. 
require_relative 'board'
require_relative 'player'
require_relative 'board_case'

#réutilisation des méthodes de la classes Board (board_display, board_new, play_turn et victory)
class Game < Board
    attr_accessor :players, :board, :current_player

    def initialize(player1, player2) #À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
        @players = [] #création d'un array de joueurs afin de stocker les deux jouers
        @board = Board.new
        @current_player = Player.new(player1, "O") #création des deux joueurs et attribution de leur symbole
        @players << @current_player #Attention de bien push les deux joueurs sinon un seul sera dans le tableau
        @current_player = Player.new(player2, "X")
        @players << @current_player #Attention de bien push les deux joueurs sinon un seul sera dans le tableau
    end

    #lance une partie complète (utilisation des méthodes du ficher board.rb)
    def turn
        loop do
        system('clear') #nettoyer l'affichage
        
        board.board_display
        
        #tour du joueur 1
        puts "C'est au tour de : #{players[0].name}".green
        board.play_turn("01")
        board.board_display
        
        #sors de la boucle en cas de victoire du joueur 1
        if board.victory == "O"
        puts "Bravo #{players[0].name} !".green
        puts "Tu as gagné !".green
        break
        end

        #tour du joueur 2
        puts "C'est au tour de : #{players[1].name}".blue
        board.play_turn("02")
        board.board_display

        #sors de la boucle en cas de victoire du joueur 2
        if board.victory == "X"
        puts "Bravo #{players[1].name} !".blue
        puts "Tu as gagné !".blue
        break
        end

        #sors de la boucle en cas d'égalité
        if board.victory == "Match nul".red
        puts "Pas de gagnant ! Relancez une partie pour vous départager !".red
        break
        end
    end
end

    def new_round
        board.board_new #nettoie le tableau pour une nouvelle partie
    end
end


