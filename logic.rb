module Logic
    
    def solved?(code, guess)
        code == guess
    end

    def compare(code, guess)

        @exact, @same = 0, 0
        original = code.clone
        fake = guess.clone
        original.each_with_index do |num, index|
            if num == fake[index]
                @exact += 1
            end
        end
        original.each_with_index do |num, index|
            if fake.include?(num)
                fake.delete_at(fake.index(num))
                @same += 1
            end
        end
        @same -= @exact
    end

end