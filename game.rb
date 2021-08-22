class Game
    def start
        puts 'To play MAKER mode press 1 or Press 2 to play BREAKER mode.'
        game_mode = selection
        game_mode == '1' ? code_maker : code_breaker
    end

    def selection
        choice = gets.chomp
        if choice == '1' or choice == '2'
            return choice
        else
            puts 'Error: Invalid Input.'
            selection
        end
    end

    def code_maker
        maker = Computer.new
        maker.start
    end

    def code_breaker
        breaker = Human.new
        breaker.start
    end
end