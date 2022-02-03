#Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie.

class Player
    attr_accessor :name, :symbol
    
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

#Test PRY : 
#David = Player.new("David","X")
#<Player:0x00007fffc8aa1a48 @name="David", @symbol="X">