require_relative 'game'
require_relative 'computer'
require_relative 'human'
require_relative 'display'

puts ' '
puts 'Welcome to console edition of Master Mind !!! '
puts ' '

def play
    game = Game.new
    game.start
    play_again
end

def play_again

    puts ''
    puts 'Would you like to play again? Type "Y" or "N".'
    respond = gets.chomp

    if respond == 'Y' || respond == 'y'
        puts "Let's play another game!"
        play
    else
        puts 'Thanks for playing!'
        exit
    end 
end

play