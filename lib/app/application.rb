#Application : cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.
require_relative 'board'
require_relative 'player'
require_relative 'board_case'
require_relative 'game'

class Application

    #méthode pour afficher le message de début
    def start
        system('clear') #permet de nettoyer le terminal
        puts "------------------------------------------------".red
        puts "|                                               |".red
        puts "|     Bienvenue sur TIC TAC TOE !!!!!!!!!!!!!!  |".red
        puts "|                                               |".red
        puts "-------------------------------------------------".red
        puts ""
        puts "Rappel des règles : le premier joueur à aligner 3 symboles => GAGNE !".red
        puts "Affronte un autre joueur !".red
        puts "Commençons !".red
    end

    #Demande des noms aux joueurs
    def ask_name1
        puts "Quel est le prénom du premier joueur ?".green
        print "JOUEUR 1 : ".green
        player1 = gets.chomp
        puts "Par défaut, ton symbole sera O !".green
        puts ""
        return player1.green
        puts ""
    end

    def ask_name2    
        puts "Quel est le prénom du deuxième joueur ?".blue
        print "JOUEUR 2 : ".blue
        player2 = gets.chomp
        puts "Ton symbole sera X !".blue
        puts ""
        return player2.blue
    end

    def perform
        start
        player1 = ask_name1
        player2 = ask_name2
        game = Game.new(player1, player2)
        game.turn
    end
end

