#BoardCase : chacune des 9 instances de BoardCase correspond à l'état d'une case du plateau.

class BoardCase
    attr_accessor :state, :name
    #state : ce que la case vaut : vide, X ou O.
    #name : le nom de la case : A1 etc.

    def initialize(name)
        @name = name
        @state = " " #la case vaut vide à l'initialisation.
    end
end

#Test PRY : 
#A = BoardCase.new("A1")
#<BoardCase:0x00007fffdc245cc8 @name="A1", @state=" ">
