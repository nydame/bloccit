module RandomData
    # Put 4, 5 or 6 random sentences together to make a random_paragraph
    def self.random_paragraph
        sentences = []
        rand(4..6).times do
            sentences << random_sentence
        end
        sentences.join(" ")
    end
    # Put between 3 and 8 words together to make a random sentence
    def self.random_sentence
        words = []
        rand(3..8).times do
            words << random_word
        end
        sentence = words.join(" ")
        sentence.capitalize << "."
    end
    # Put between 3 and 8 randomly chosen letters together to make a random word
    def self.random_word
        letters = ('a'..'z').to_a
        letters.shuffle!
        letters[0, rand(3..8)].join
    end

end
