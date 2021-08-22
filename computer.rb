require './display'
require './logic'

class Computer
    attr_reader :code, :guess, :exact, :same, :turn, :num_count

    include Display
    include Logic

    def start
        puts "Enter a 4 digit code with digits between 1 to 6"
        @code = input_code.split(//)
        puts 'Your entered code is '
        show_code(code)
        puts ''
        find_number
        find_order
        special_message
    end

    def input_code
        run = true
        while run 
            input = gets.chomp
            input = input.split(//)
            if input.length == 4
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

    def find_number
        num = %w(1 2 3 4 5 6)
        num = num.shuffle
        @turn = 1
        @guess = []
        guess_number(num,0 ,guess)
    end

    def guess_number(num, index, guess)
        @guess.pop(4 - num_count) if turn != 1
        @guess << num[index] while @guess.length != 4
        computer_turn(code, guess)
        @turn += 1
        return @guess if num_count == 4

        guess_number(num, index + 1, guess)
    end

    def computer_turn(code, guess)
        sleep(1)
        puts "Turn : #{turn}"
        show_code(guess)
        compare(code, guess)
        show_clue(exact, same)
        @num_count = @exact + @same
    end

    def find_order
        index = 0
        while @turn < 13
            if correct_digit?(index, code, guess)
                index += 1
            end
            a = @guess.delete_at(index)
            @guess << a
            computer_turn(code, guess)
            @turn += 1
            break if solved?(code, guess)
        end
    end

    def correct_digit?(index, code, guess)
        current_code = code[index]
        current_guess = guess[index]
        compare([current_code], [current_guess])
        if @exact == 1
            return true
        else
            return false
        end
    end

    def special_message
        puts ''
        if @turn < 7
            puts "That was easy too easy for me"
        elsif @turn < 12
            puts "Think a better code next time"
        else
            puts "That was so close!"
        end
    end

end