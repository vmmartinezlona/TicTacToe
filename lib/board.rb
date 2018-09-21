module TicTacToe
    class Board
        attr_reader :grid
        def initialize(input = {})
            @grid = input.fetch(:grid, default_grid)
        end

        def get_cell(x, y)
            grid[y][x]
        end
        
        def set_cell(x, y, value)
            get_cell(x, y).value = value
        end

        def game_end
            return :winner if winner?
            return :draw if draw?
            false
        end

        private
        
        def default_grid
            Array.new(3) {Array.new(3) {Cell.new}}
        end       
        
        def all_empty?
            self.all? {|element| element.to_s.empty?}
        end
        
        def all_same?
            self.all? { |element| element == self[0] }
        end
        
        def any_empty?
            self.any? { |element| element.to_s.empty? }
        end
        
        def none_empty?
            !any_empty?
        end
        
        # Si ninguno de los elementos esta vacio
        #gato
        def draw?
            grid.flatten.map { |cell| cell.value }.none_empty?
        end
        
        def winning_positions
            grid + #rows
            grid.transpose + #columns
            diagonals #two diagonals
        end
        
        def diagonals
            [
            Matrix.rows(grid).each(:diagonal).to_a,
            Matrix.rows(grid.to_a.map(&:reverse).transpose).each(:diagonal).to_a
            ]
            # [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
            # [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
        end
        
        def winner?
            winning_positions.each do |winning_position|
            next if winning_position_values(winning_position).all_empty?
            return true if winning_position_values(winning_position).all_same?
            end
            false
        end
        
        def winning_position_values(winning_position)
            winning_position.map { |cell| cell.value }
        end
        
    end
end