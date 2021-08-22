require './display'
require './logic'

class Human
    attr_reader :code, :guess, :exact, :same

    include Display
    include Logic

    def initialize
        random_number = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
        @code = random_number.join('')
        @code = @code.split(//)
    end

    def start
        turn = 0
        while turn < 12
            turn += 1
            puts "turn : #{turn} " 
            @guess = input_guess.split(//)
            break if guess[0] == 'q'
            show_code(guess)
            break if solved?(code, guess)
            compare(code, guess)
            show_clue(exact, same)
        end
        special_message(turn)
    end

    def input_guess
        run = true
        while run 
            puts 'Enter your 4 digit guess or q to quit'
            input = gets.chomp
            input = input.split(//)
            if input[0] == 'q'
                input = input.join('')
                run = false
            elsif input.length == 4
                a = input.select { |num| num.to_i.between?(1, 6) }
                if a.length == 4
                    input = input.join('')
                    run = false
                else
                    puts 'Error: input digits is not between 1 to 6'
                end
            else
                puts 'Error: Input number is not of 4 digits'
            end
        end
        input
    end

    def special_message (turn)
        puts ''
        if !solved?(code, guess)
            puts 'It was too tough, Better luck next time'
            puts 'The code was'
            show_code(code)
        else
            if turn < 7
                puts 'You are a genius !'
            elsif turn < 12
                puts 'You break the code'
            else
                puts 'That was so close!'
            end
        end
    end

end