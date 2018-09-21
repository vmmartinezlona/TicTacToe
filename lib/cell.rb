# The class cell is for the cell in the game board
module TicTacToe
    class Cell
        attr_accessor :value
        # When a cell is create the default value is blank
        #The posibles values are "X", "Y", ""
        def create(value = "")
            @value = value;
        end
    end
end