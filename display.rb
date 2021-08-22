module Display

    def colors(char)
        {
          '1' => "\e[101m  1  \e[0m ",
          '2' => "\e[43m  2  \e[0m ",
          '3' => "\e[44m  3  \e[0m ",
          '4' => "\e[45m  4  \e[0m ",
          '5' => "\e[46m  5  \e[0m ",
          '6' => "\e[41m  6  \e[0m ",
          '*' => "\e[91m \u25CF \e[0m",
          '?' => "\e[37m \u25CB \e[0m ",
        }[char]
    end

    def show_code (arr)
        arr.each do |num|
            print colors(num)
        end
        print ' '
    end

    def show_clue(exact, same)
        print '  '
        exact.times { print colors('*') }
        same.times { print colors('?') }
        puts ''
    end
    
end