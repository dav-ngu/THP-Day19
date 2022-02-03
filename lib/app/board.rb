#Board : c'est le plateau. 
require_relative 'board_case'
require_relative 'player'

class Board
    attr_accessor :array_board
    #aide : le Board doit embarquer les 9 BoardCases du jeu afin de pouvoir les lire et les modifier facilement. 
            #Il faut les lui attribuer sous forme d'un array ou d'un hash. => ici utilisation de l'array_board

    def initialize
        @array_board = []
        
        #on définie le nom des cases du morpion et on les ajoute au tableau. A l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).
        (array_board).push(BoardCase.new("A1"))
        (array_board).push(BoardCase.new("A2"))
        (array_board).push(BoardCase.new("A3"))
        (array_board).push(BoardCase.new("B1"))
        (array_board).push(BoardCase.new("B2"))
        (array_board).push(BoardCase.new("B3"))
        (array_board).push(BoardCase.new("C1"))
        (array_board).push(BoardCase.new("C2"))
        (array_board).push(BoardCase.new("C3"))
    end
  
    #affichage du tableau en mode morpion / array[i].state pour afficher en position i => " " ou "X" ou "O" qui dépend du state de la BoardCase
    def board_display
        puts " "
        puts "            | 1 | 2 | 3 "
        print "         "
        puts "-" * 15
        puts "          A | #{array_board[0].state} | #{array_board[1].state} | #{array_board[2].state} "
        print "         "
        puts "-" * 15
        puts "          B | #{array_board[3].state} | #{array_board[4].state} | #{array_board[5].state} "
        print "         "
        puts "-" * 15
        puts "          C | #{array_board[6].state} | #{array_board[7].state} | #{array_board[8].state} "
        puts " "
    end

    #remettre le tableau vide lors du lancement d'une nouvelle partie
    def board_new
        empty = " "
        array_board[0].state = empty
        array_board[1].state = empty
        array_board[2].state = empty
        array_board[3].state = empty
        array_board[4].state = empty
        array_board[5].state = empty
        array_board[6].state = empty
        array_board[7].state = empty
        array_board[8].state = empty
    end

    #méthode qui sert à provoquer un tour : demander au joueur ce qu'il souhaite faire et ajouter X ou O à la BoardCase
    def play_turn(player)
    
    #déterminer le symbole des joueurs
    if player == "01"
        a = "O"
      else 
        a = "X"
    end

    #choix du joueur
    puts "Quelle case choisis-tu ? Ecris en majuscule."
    print "> "
    choice = gets.chomp
    
    #remplissage de la case choisie : 
    #si choix différent du nom d'une case => renvoie au gets.chomp
    #si case déjà remplie => message pour dire que la case est remplie + renvoie au gets.chomp
    #si case == " " => je mets le symbole
    loop do
        case choice #utilisation de when
        when "A1"
            if array_board[0].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[0].state = a
                break
            end
        
        when "A2"
            if array_board[1].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[1].state = a
                break
            end
        
        when "A3"
            if array_board[2].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[2].state = a
                break
            end
        
        when "B1"
            if array_board[3].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[3].state = a
                break
            end

        when "B2"
            if array_board[4].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[4].state = a
                break
            end
        
        when "B3"
            if array_board[5].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[5].state = a
                break
            end

        when "C1"
            if array_board[6].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[6].state = a
                break
            end

        when "C2"
            if array_board[7].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[7].state = a
                break
            end

        when "C3"
            if array_board[8].state != " "
                puts "Tu as essayé de voler une case à ton adversaire, mais tu peux pas !".red
                puts "Choisis une autre case :".red
                print "> ".red
                choice = gets.chomp
            else
                array_board[8].state = a
                break
            end
        
        else #si l'entrée ne correspond pas a une case attendue, renvois à gets.chomp
            puts "Tu n'as pas entré une case valide.".red
            puts "Essaie encore en mettant bien les majuscules : ".red
            print "> ".red
            choice = gets.chomp
            end
        end
    end

    def victory
        #renseigner les possibilités de victoire du joueur 01
        if array_board[0].state == array_board[1].state && array_board[1].state == array_board[2].state && array_board[2].state == "O"
            return "O" #première ligne 
        elsif array_board[3].state == array_board[4].state && array_board[4].state == array_board[5].state && array_board[5].state == "O"
            return "O" #deuxième ligne 
        elsif array_board[6].state == array_board[7].state && array_board[7].state == array_board[8].state && array_board[8].state == "O"
            return "O" #troisième ligne
        elsif array_board[0].state == array_board[3].state && array_board[3].state == array_board[6].state && array_board[6].state == "O"
            return "O" #première colonne
        elsif array_board[1].state == array_board[4].state && array_board[4].state == array_board[7].state && array_board[7].state == "O"
            return "O" #deuxième colonne
        elsif array_board[2].state == array_board[5].state && array_board[5].state == array_board[8].state && array_board[8].state == "O"
            return "O" #troisième colonne
        elsif array_board[0].state == array_board[4].state && array_board[4].state == array_board[8].state && array_board[8].state == "O"
            return "O" #première diagonale
        elsif array_board[2].state == array_board[4].state && array_board[4].state == array_board[6].state && array_board[6].state == "O"
            return "O" #deuxième diagonale
        
        #renseigner les possibilités de victoire du joueur 02
        if array_board[0].state == array_board[1].state && array_board[1].state == array_board[2].state && array_board[2].state == "X"
            return "X" #première ligne 
        elsif array_board[3].state == array_board[4].state && array_board[4].state == array_board[5].state && array_board[5].state == "X"
            return "X" #deuxième ligne 
        elsif array_board[6].state == array_board[7].state && array_board[7].state == array_board[8].state && array_board[8].state == "X"
            return "X" #troisième ligne
        elsif array_board[0].state == array_board[3].state && array_board[3].state == array_board[6].state && array_board[6].state == "X"
            return "X" #première colonne
        elsif array_board[1].state == array_board[4].state && array_board[4].state == array_board[7].state && array_board[7].state == "X"
            return "X" #deuxième colonne
        elsif array_board[2].state == array_board[5].state && array_board[5].state == array_board[8].state && array_board[8].state == "X"
            return "X" #troisième colonne
        elsif array_board[0].state == array_board[4].state && array_board[4].state == array_board[8].state && array_board[8].state == "X"
            return "X" #première diagonale
        elsif array_board[2].state == array_board[4].state && array_board[4].state == array_board[6].state && array_board[6].state == "X"
            return "X" #deuxième diagonale
        
        #Egalité lorsque toutes les cases sont remplies
        elsif array_board[0].state != " " && array_board[1].state != " " && array_board[2].state != " " && array_board[3].state != " " && array_board[4].state != " " && array_board[5].state != " " && array_board[6].state != " " && array_board[7].state != " " && array_board[8].state != " "
            return "Match nul"
        end
        else 
        return false
        end
          
        end
      
     
    end