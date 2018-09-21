module
    class Player
        attr_accessor :name, :figure
        def inicial(move)
        @figure = move.fetch(:figure){ '' }
        @name = move.fecth(:name){ 'Default' }
        end
    end
end